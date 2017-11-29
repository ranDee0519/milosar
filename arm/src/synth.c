#include "synth.h"


void load_parameters(Synthesizer *synth)
{
	//ensure that the register array is cleared
	memset(synth->registers, 0, sizeof(synth->registers));
	
	//reset all ramp parameters
	for(int i = 0; i < MAX_RAMPS; i++)
	{
		synth->ramps[i].number = i;  
		synth->ramps[i].bandwidth = 0; 
		synth->ramps[i].next = 0;    
		synth->ramps[i].trigger = 0;
		synth->ramps[i].reset = 0;
		synth->ramps[i].flag = 0;	
		synth->ramps[i].doubler = 0;
		synth->ramps[i].length = 0;
		synth->ramps[i].increment = 0;
	}	
	
	char* dir = "ramps/";
	char* path = (char*)malloc(strlen(dir) + strlen(synth->param_file));
	strcpy(path, dir);
	strcat(path, synth->param_file);	
	
	if (ini_parse(path, handler, synth) < 0) 
	{
		ASSERT(FAIL, "Could not open .ini file.\n");
		exit(EXIT_FAILURE);
    }   
}


//handler function called for every element in the ini file
//current implementation is inefficient, but no alternative could be found
int handler(void* pointer, const char* section, const char* attribute, const char* value)
{			
	char* rampSection = (char*)malloc(50*sizeof(char));
	Synthesizer* synth = (Synthesizer*)pointer;
	
	#define MATCH(s, n) strcmp(section, s) == 0 && strcmp(attribute, n) == 0
	
	if (MATCH("setup", "frac_num")) synth->fractionalNumerator = atoi(value);
	
	for(int i = 0; i < MAX_RAMPS; i++)
	{
		sprintf(rampSection, "ramp%i", i);

		if (MATCH(rampSection, "length")) 			synth->ramps[i].length    = atof(value); 
		else if (MATCH(rampSection, "bandwidth")) 	synth->ramps[i].bandwidth = atof(value);  
		else if (MATCH(rampSection, "increment")) 	synth->ramps[i].increment = atof(value);
		else if (MATCH(rampSection, "next")) 		synth->ramps[i].next      = atoi(value);    
		else if (MATCH(rampSection, "trigger")) 	synth->ramps[i].trigger   = atoi(value);
		else if (MATCH(rampSection, "reset")) 		synth->ramps[i].reset     = atoi(value);
		else if (MATCH(rampSection, "flag")) 		synth->ramps[i].flag      = atoi(value);	
		else if (MATCH(rampSection, "doubler")) 	synth->ramps[i].doubler   = atoi(value);	
	}	
	
	return 1;	
}


void calc_parameters(Synthesizer *synth, Configuration *config)
{	
	if (config->is_debug_mode) 
	{
		cprint("\n[**] ", BRIGHT, CYAN);	
		printf("Synthesizer %i loaded with %s:\n", synth->number, synth->param_file);
		printf("Frequency Offset: %f [MHz]\n", vcoOut(synth->fractionalNumerator));
		printf("Fractional Numerator: %d\n", synth->fractionalNumerator);		
		printf("| NUM | NXT | RST | DBL |   LEN |            INC |      BNW |\n");
	}
	
	float phase_detector_frequency = 100.0; // after doubler and divider [Hz]
	
	for (int i = 0; i < 8; i++)
	{
		if (synth->ramps[i].length > pow(2, 16) - 1)
		{
			cprint("[!!] ", BRIGHT, RED);
			printf("Synth %i, ramp %i length set to maximum.\n", synth->number, i);
			synth->ramps[i].length = (uint16_t)(pow(2, 16) - 1);			
		}
		
		//calculate RAMPx_INC = (bandwidth [Hz] * (2^24 - 1))/(phase detector frequency [MHz] * ramp_length)
		if ((synth->ramps[i].length != 0) && (synth->ramps[i].increment == 0))
		{
			synth->ramps[i].increment = (synth->ramps[i].bandwidth*4*(pow(2, 24) - 1))/(phase_detector_frequency*synth->ramps[i].length*pow(10,6));			
		}
		
		if (synth->ramps[i].increment > pow(2, 30) - 1)
		{
			cprint("[!!] ", BRIGHT, RED);
			printf("Synth %i, ramp %i increment set to maximum.\n", synth->number, i);
			synth->ramps[i].length = (uint16_t)(pow(2, 30) - 1);			
		}		
		
		//perform two's complement for negative values: 2^30 - value
		if (synth->ramps[i].increment < 0.0)
		{
			synth->ramps[i].increment = pow(2, 30) + synth->ramps[i].increment;
		}		
		
		//set bit 31 if doubler key is true
		if (synth->ramps[i].doubler)
		{
			synth->ramps[i].increment = (uint64_t)synth->ramps[i].increment | (uint64_t)pow(2, 31);	
		}
		
		//scheme to generate for R92, R96, R103 etc.. 
		synth->ramps[i].nextTriggerReset = 0;
		
		synth->ramps[i].nextTriggerReset += (synth->ramps[i].next << 5) & 0xFF;
		synth->ramps[i].nextTriggerReset += (synth->ramps[i].trigger << 3) & 0xFF;
		synth->ramps[i].nextTriggerReset += (synth->ramps[i].reset << 2) & 0xFF;
		synth->ramps[i].nextTriggerReset += (synth->ramps[i].flag << 0) & 0xFF;
		
		if ((config->is_debug_mode) && (synth->ramps[i].next + synth->ramps[i].length + synth->ramps[i].increment + synth->ramps[i].reset != 0))
		{
			printf("|   %i |   %i |   %i |   %i | %5i | %14.3f | %8.3f |\n", 
			synth->ramps[i].number, synth->ramps[i].next, synth->ramps[i].reset, synth->ramps[i].doubler, synth->ramps[i].length, 
			synth->ramps[i].increment, bnwOut(synth->ramps[i].increment, synth->ramps[i].length));
		}		
	}	
	if (config->is_debug_mode) printf("\n");
}


void generateHexValues(Synthesizer *synth)
{	
	for (int i = 0; i < 8; i++)
	{	
		synth->ramps[i].hexIncrement     = (char*)malloc(8*sizeof(char));
		synth->ramps[i].hexLength        = (char*)malloc(4*sizeof(char));	
		synth->ramps[i].hexNextTrigReset = (char*)malloc(2*sizeof(char));
		
		memset(synth->ramps[i].hexIncrement, 0, 8*sizeof(char));
		memset(synth->ramps[i].hexLength, 0, 4*sizeof(char));
		memset(synth->ramps[i].hexNextTrigReset, 0, 2*sizeof(char));		
		
		sprintf(synth->ramps[i].hexIncrement, "%08X", (int)synth->ramps[i].increment);	
		sprintf(synth->ramps[i].hexLength, "%04X", (int)synth->ramps[i].length);		
		sprintf(synth->ramps[i].hexNextTrigReset, "%02X", (int)synth->ramps[i].nextTriggerReset);	
	}	
}


void generateBinValues(Synthesizer *synth)
{
	synth->binFractionalNumerator = (int*)malloc(24*sizeof(int));
	memset(synth->binFractionalNumerator, 0, 24*sizeof(int));
	decimalToBinary(synth->fractionalNumerator, synth->binFractionalNumerator);	
	
	for (int i = 0; i < 8; i++)
	{	
		synth->ramps[i].binIncrement     = (int*)malloc(32*sizeof(int));
		synth->ramps[i].binLength        = (int*)malloc(16*sizeof(int));	
		synth->ramps[i].binNextTrigReset = (int*)malloc(8*sizeof(int));		
		
		memset(synth->ramps[i].binIncrement, 	 0, 32*sizeof(int));
		memset(synth->ramps[i].binLength, 		 0, 16*sizeof(int));
		memset(synth->ramps[i].binNextTrigReset, 0,  8*sizeof(int));		
		
		decimalToBinary(synth->ramps[i].increment, synth->ramps[i].binIncrement);
		decimalToBinary(synth->ramps[i].length, synth->ramps[i].binLength);
		decimalToBinary(synth->ramps[i].nextTriggerReset, synth->ramps[i].binNextTrigReset);	
	}
}


void printBinary(int* binaryValue, int paddedSize)
{
	for (int i = paddedSize - 1; i >= 0; i--)
	{
		printf("%d", binaryValue[i]);
	}
}


void decimalToBinary(uint64_t decimalValue, int* binaryValue)
{
	int i = 0;
	
	while(decimalValue > 0)
	{
		binaryValue[i] = decimalValue%2;
		decimalValue = decimalValue/2;
		i++;
	}
}


void readTemplateFile(const char* filename, Synthesizer *synth)
{
	FILE *templateFile;
	char line[86][15];
	char trash[15];
	
	//Open specified file
	templateFile = fopen(filename,"r");
	
	//Check if file correctly opened
	if (templateFile == 0)
	{
		cprint("[!!] ", BRIGHT, RED);
		printf("Could not open %s. Check that the file name is correct.\n", filename);
		exit(0);
	}
	else
	{
		for (int l = 0; l < 86; l++)
		{
			fscanf(templateFile, "%s",trash);
			fscanf(templateFile, "%s",line[l]);
			
			//get hex values and convert to decimal
			char hexValue[] = {line[l][6], line[l][7]};			
			int decimalValue = strtoul(hexValue, NULL, 16);			
			
			//convert decimal to binary and store in register array
			decimalToBinary(decimalValue, synth->registers[85 - l]);					
		}
	}
	//close file
	fclose(templateFile);
}


void printRegisterValues(Synthesizer *synth)
{	
	for (int i = 141; i >= 0; i--)
	{		
		printf("R%03i : ", i);
		printBinary(synth->registers[i], 8);	
		printf("\n");
	}	
	printf("\n");
}


void insertRampParameters(Synthesizer *synth)
{
	
	//======================================================================================
	//for every ramp
	for (int i = 7; i >= 0; i--)
	{
		//for every bit
		for (int j = 7; j >= 0; j--)
		{
			synth->registers[92 + 7*i][j] = synth->ramps[i].binNextTrigReset[j];
		}
	}
	//======================================================================================
	
	
	
	//======================================================================================
	//for every ramp
	for (int i = 7; i >= 0; i--)
	{
		//for every bit
		for (int j = 15; j >= 8; j--)
		{
			synth->registers[91 + 7*i][j - 8] = synth->ramps[i].binLength[j];
		}
	}	
	
	//for every ramp
	for (int i = 7; i >= 0; i--)
	{
		//for every bit
		for (int j = 7; j >= 0; j--)
		{
			synth->registers[90 + 7*i][j] = synth->ramps[i].binLength[j];
		}
	}	
	//======================================================================================
	
	
	
	//======================================================================================
	//for every ramp
	for (int i = 7; i >= 0; i--)
	{
		//for every bit
		for (int j = 31; j >= 24; j--)
		{
			synth->registers[89 + 7*i][j - 24] = synth->ramps[i].binIncrement[j];
		}
	}
	
	//for every ramp
	for (int i = 7; i >= 0; i--)
	{
		//for every bit
		for (int j = 23; j >= 16; j--)
		{
			synth->registers[88 + 7*i][j - 16] = synth->ramps[i].binIncrement[j];
		}
	}
	
	//for every ramp
	for (int i = 7; i >= 0; i--)
	{
		//for every bit
		for (int j = 15; j >= 8; j--)
		{
			synth->registers[87 + 7*i][j - 8] = synth->ramps[i].binIncrement[j];
		}
	}
	
	//for every ramp
	for (int i = 7; i >= 0; i--)
	{
		//for every bit
		for (int j = 7; j >= 0; j--)
		{
			synth->registers[86 + 7*i][j] = synth->ramps[i].binIncrement[j];
		}
	}
	//======================================================================================	
	
	
	//======================================================================================		
	//for every bit
	for (int j = 23; j >= 16; j--)
	{
		synth->registers[21][j - 16] = synth->binFractionalNumerator[j];
	}
	
	//for every bit
	for (int j = 15; j >= 8; j--)
	{
		synth->registers[20][j - 8] = synth->binFractionalNumerator[j];
	}
	
	//for every bit
	for (int j = 7; j >= 0; j--)
	{
		synth->registers[19][j] = synth->binFractionalNumerator[j];
	}
	//======================================================================================	
}


void init_pins(Synthesizer *synth)
{
	/*int offset = 4*(synth->number - 1);

	//Initialize pins
	synth->latchPin = offset + 0 + RP_DIO0_N;
	synth->dataPin  = offset + 1 + RP_DIO0_N;
	synth->clockPin = offset + 2 + RP_DIO0_N;
	synth->trigPin  = offset + 3 + RP_DIO0_N;

	//Set directions of pins
	rp_DpinSetDirection(synth->latchPin, RP_OUT);
	rp_DpinSetDirection(synth->dataPin, RP_OUT);
	rp_DpinSetDirection(synth->clockPin, RP_OUT);
	rp_DpinSetDirection(synth->trigPin, RP_OUT);
	
	//Pull trigger pin low
	rp_DpinSetState(synth->trigPin, RP_LOW);*/
}


void setRegister(Synthesizer *synth, int registerAddress, int registerValue)
{
	/*int binAddress[16];
	int binRegister[8];
	
	memset(binAddress, 0, 16*sizeof(int));
	memset(binRegister, 0, 8*sizeof(int));
	
	decimalToBinary(registerAddress, binAddress);	
	decimalToBinary(registerValue, binRegister);
	
	//Latch enable high
	rp_DpinSetState(synth->latchPin, RP_HIGH);
	usleep(1);

	//Clock high
	rp_DpinSetState(synth->clockPin, RP_HIGH);
	usleep(1);

	//latch enable low
	rp_DpinSetState(synth->latchPin, RP_LOW);
	usleep(1);

	//data low
	rp_DpinSetState(synth->dataPin, RP_LOW);
	usleep(1);

	//clock setup time
	usleep(1000);

	//clock high
	rp_DpinSetState(synth->clockPin, RP_HIGH);
	usleep(1);

	//clock low
	rp_DpinSetState(synth->clockPin,RP_LOW);
	usleep(1);

	for (int j = 15; j >= 0 ; j--)
	{
		//Assert address bits on data line
		if (binAddress[j] == 1)
		{
			rp_DpinSetState(synth->dataPin, RP_HIGH);
		}
		else
		{
			rp_DpinSetState(synth->dataPin, RP_LOW);
		}
		
		//clock high
		rp_DpinSetState(synth->clockPin, RP_HIGH);
		usleep(1);
		
		//clock low
		rp_DpinSetState(synth->clockPin, RP_LOW);				
		usleep(1);
	}			
	
	//Only do this the first loop iteration, set addressFlag
	synth->addressFlag = 1;	

	//Write register data
	for(int j = 7; j >= 0; j--)
	{
		if (binRegister[j] == 1)
		{
			rp_DpinSetState(synth->dataPin, RP_HIGH);
		}
		else
		{
			rp_DpinSetState(synth->dataPin, RP_LOW);
		}
		
		//clock high
		rp_DpinSetState(synth->clockPin, RP_HIGH);
		usleep(1);
		
		//clock low
		rp_DpinSetState(synth->clockPin, RP_LOW);
		usleep(1);
	}
	
	//Latch enable high
	rp_DpinSetState(synth->latchPin, RP_HIGH);
	usleep(1);

	//data low
	rp_DpinSetState(synth->dataPin, RP_LOW);*/	
}


void updateRegisters(Synthesizer *synth)
{
	/*int startAddress = 141;
	int binAddress[16];
	memset(binAddress, 0, 16*sizeof(int));
	decimalToBinary(startAddress, binAddress);
	
	synth->addressFlag = 0;
	
	for (int i = 141; i >= 0; i--)
	{
		if (synth->addressFlag == 0)
		{
			//Latch enable high
			rp_DpinSetState(synth->latchPin, RP_HIGH);
			usleep(1);

			//Clock high
			rp_DpinSetState(synth->clockPin, RP_HIGH);
			usleep(1);

			//latch enable low
			rp_DpinSetState(synth->latchPin, RP_LOW);
			usleep(1);

			//data low
			rp_DpinSetState(synth->dataPin, RP_LOW);
			usleep(1);

			//clock setup time
			usleep(1000); 

			//clock high
			rp_DpinSetState(synth->clockPin, RP_HIGH);
			usleep(1);

			//clock low
			rp_DpinSetState(synth->clockPin,RP_LOW);
			usleep(1);

			for (int j = 15; j >= 0 ; j--)
			{
				//Assert address bits on data line
				if (binAddress[j] == 1)
				{
					rp_DpinSetState(synth->dataPin, RP_HIGH);
				}
				else
				{
					rp_DpinSetState(synth->dataPin, RP_LOW);
				}
				
				//clock high
				rp_DpinSetState(synth->clockPin, RP_HIGH);
				usleep(1);
				
				//clock low
				rp_DpinSetState(synth->clockPin, RP_LOW);				
				usleep(1);
			}			
			
			//Only do this the first loop iteration, set addressFlag
			synth->addressFlag = 1;
		}

		//Write register data
		for(int j = 7; j >= 0; j--)
		{
			if (synth->registers[i][j] == 1)
			{
				rp_DpinSetState(synth->dataPin, RP_HIGH);
				//rp_DpinSetState(RP_LED2, RP_HIGH);
			}
			else
			{
				rp_DpinSetState(synth->dataPin, RP_LOW);
				//rp_DpinSetState(RP_LED2, RP_LOW);
			}
			
			//clock high
			rp_DpinSetState(synth->clockPin, RP_HIGH);
			usleep(1);
			
			//clock low
			rp_DpinSetState(synth->clockPin, RP_LOW);
			usleep(1);
		}
	}
	
	//Latch enable high
	rp_DpinSetState(synth->latchPin, RP_HIGH);
	usleep(1);

	//data low
	rp_DpinSetState(synth->dataPin, RP_LOW);*/
}
 
 
void triggerSynthesizers(Synthesizer *synthOne, Synthesizer *synthTwo)
{
	/*rp_DpinSetState(synthOne->trigPin, RP_LOW);
	rp_DpinSetState(synthTwo->trigPin, RP_LOW);	
	usleep(1);	
	rp_DpinSetState(synthTwo->trigPin, RP_HIGH);
	rp_DpinSetState(synthOne->trigPin, RP_HIGH);*/
}


void parallelTrigger(Synthesizer *synthOne, Synthesizer *synthTwo)
{		
	/*cprint("[??] ", BRIGHT, BLUE);
	printf("Press enter to trigger...");
	
	//Dirty, but it works...
	getchar();
	getchar();
	
	//Rising edge required
	setpins(synthOne->trigPin - RP_DIO0_N, 0, synthTwo->trigPin - RP_DIO0_N, 0, 0x4000001C);
	usleep(1);
	setpins(synthOne->trigPin - RP_DIO0_N, 1, synthTwo->trigPin - RP_DIO0_N, 1, 0x4000001C);*/
}


void configureVerbose(Configuration *config, Synthesizer *synthOne, Synthesizer *synthTwo)
{
	char userin;	

	do
	{  
		cprint("[??] ", BRIGHT, BLUE);
		printf("Ramps: ");	    
	} while (((scanf("%d%c", &config->n_ramps, &userin)!=2 || userin!='\n') && clean_stdin()));
	
	config->outputSize = (16*config->n_ramps*(config->ns_ext_buffer + config->ns_ref_buffer))/(8*1e6);		

	//read-write mode
	system("rw\n");

	//create time-stamped folder
	char syscmd[100];
	char foldername[100];
	config->timeStamp = (char*)malloc(20*sizeof(char));
	
	time_t rawtime = time(NULL);
	struct tm tm = *localtime(&rawtime);
	
	sprintf(config->timeStamp, "%02d_%02d_%02d_%02d_%02d_%02d", tm.tm_mday, tm.tm_mon + 1, tm.tm_year + 1900 - 2000, tm.tm_hour, tm.tm_min, tm.tm_sec);
	sprintf(foldername, "%s/%s/", config->storageDir, config->timeStamp);
	sprintf(syscmd, "mkdir %s/%s", config->storageDir, config->timeStamp);		
	system(syscmd);
	
	char* ch1_out = (char*)malloc(100*sizeof(char));
	strcpy(ch1_out, foldername);
	strcat(ch1_out, "ext.bin");
	
	char* ch2_out = (char*)malloc(100*sizeof(char));
	strcpy(ch2_out, foldername);
	strcat(ch2_out, "ref.bin");
	
	char* imu_out = (char*)malloc(100*sizeof(char));
	strcpy(imu_out, foldername);
	strcat(imu_out, "imu.bin");	
	
	char* summary = (char*)malloc(100*sizeof(char));
	strcpy(summary, foldername);
	strcat(summary, "summary.ini");	
	
	config->ch1_filename = ch1_out;
	config->ch2_filename = ch2_out;
	config->imu_filename = imu_out;
	config->summary_filename = summary;
	
	FILE* summaryFile;
	summaryFile = fopen(config->summary_filename, "w");
	
	//Check if file correctly opened
	if (summaryFile == 0)
    {
		cprint("[!!] ", BRIGHT, RED);
		printf("Could not open summary file. Ensure you have read-write access\n");
    }
	else
    {
		//copy ini parameter files
		sprintf(syscmd, "cp ramps/%s %s", synthOne->param_file, foldername);
		system(syscmd);
		
		if (synthOne->param_file != synthTwo->param_file)
		{
			sprintf(syscmd, "cp ramps/%s %s", synthTwo->param_file, foldername); 
			system(syscmd);
		}
		
		//print summary file 
		fprintf(summaryFile, "[overview]\r\n");
		fprintf(summaryFile, "timestamp = %s\r\n", config->timeStamp);
		
		cprint("[??] ", BRIGHT, BLUE);
		printf("Comment [140]: ");
		char userin[140];
		scanf("%[^\n]s", userin);
		
		fprintf(summaryFile, "comment = %s\r\n", userin);
		
		fprintf(summaryFile, "\n[dataset]\r\n");
		fprintf(summaryFile, "storage_directory = %s\r\n", config->ch1_filename);
		fprintf(summaryFile, "decimation_factor = %d\r\n", config->decFactor);
		fprintf(summaryFile, "sampling_rate =  %.2f\r\n", 125e6/config->decFactor);
		fprintf(summaryFile, "n_ramps = %i\r\n", config->n_ramps);			
		
		fprintf(summaryFile, "\n[synth_one]\r\n");
		fprintf(summaryFile, "frequency_offset = %.3f\r\n", vcoOut(synthOne->fractionalNumerator));
		fprintf(summaryFile, "fractional_numerator = %d\r\n", synthOne->fractionalNumerator);		
		fprintf(summaryFile, "| NUM | NXT | RST | DBL |   LEN |            INC |      BNW |\r\n");		
		
		for (int k = 0; k<8; k++)
		{
			if ((synthOne->ramps[k].next + synthOne->ramps[k].length + synthOne->ramps[k].increment + synthOne->ramps[k].reset != 0))
			{
				fprintf(summaryFile, "|   %i |   %i |   %i |   %i | %5i | %14.3f | %8.3f |\r\n", 
				synthOne->ramps[k].number, synthOne->ramps[k].next, synthOne->ramps[k].reset, synthOne->ramps[k].doubler, synthOne->ramps[k].length, 
				synthOne->ramps[k].increment, bnwOut(synthOne->ramps[k].increment, synthOne->ramps[k].length));
			}
		}
		
		fprintf(summaryFile, "\n[synth_two]\r\n");
		fprintf(summaryFile, "frequency_offset = %.3f\r\n", vcoOut(synthTwo->fractionalNumerator));
		fprintf(summaryFile, "fractional_numerator = %d\r\n", synthTwo->fractionalNumerator);		
		fprintf(summaryFile, "| NUM | NXT | RST | DBL |   LEN |            INC |      BNW |\r\n");
		
		for (int j = 0; j<8; j++)
		{
			if ((synthTwo->ramps[j].next + synthTwo->ramps[j].length + synthTwo->ramps[j].increment + synthTwo->ramps[j].reset != 0))
			{
				fprintf(summaryFile, "|   %i |   %i |   %i |   %i | %5i | %14.3f | %8.3f |\r\n", 
				synthTwo->ramps[j].number, synthTwo->ramps[j].next, synthTwo->ramps[j].reset, synthTwo->ramps[j].doubler, synthTwo->ramps[j].length, 
				synthTwo->ramps[j].increment, bnwOut(synthTwo->ramps[j].increment, synthTwo->ramps[j].length));	
			}	
		}      

		fclose(summaryFile);
	}	
}


void generateClock(void)
{
	/*rp_GenReset();
	rp_GenOutEnable(RP_CH_1);
	rp_GenAmp(RP_CH_1, 1.0f);  	// 2*0.5  = 1 Vpp
	rp_GenFreq(RP_CH_1, 50000000);
	rp_GenWaveform(RP_CH_1, RP_WAVEFORM_SINE);
	rp_GenMode(RP_CH_1, RP_GEN_MODE_CONTINUOUS);*/
}


int clean_stdin()
{
	while (getchar()!='\n');
	return 1;
}


double vcoOut(uint32_t fracNum)
{
	return 25*(100 + fracNum/(pow(2, 24) - 1)) - 2500;
}

double bnwOut(double rampInc, uint16_t rampLen)
{
	if(rampInc < (pow(2, 24) - 1))
		return (rampInc*rampLen*100)/pow(2, 26);
	else
		return ((rampInc - pow(2, 30))*rampLen*100)/pow(2, 26);
}

double elapsed_us(struct timeval start_time, struct timeval end_time)
{
	return ((double)end_time.tv_sec - (double)start_time.tv_sec)*1e6 + ((double)end_time.tv_usec - (double)start_time.tv_usec);
}








