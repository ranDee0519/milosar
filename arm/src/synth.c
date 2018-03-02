#include "synth.h"


void load_ramp_file(Synthesizer *synth)
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
	if (config->is_debug) 
	{
		cprint("\n[**] ", BRIGHT, CYAN);	
		printf("Synthesizer %i loaded with %s:\n", synth->number, synth->param_file);
		printf("Frequency Offset: %f [Hz]\n", vcoOut(synth->fractionalNumerator));
		printf("Fractional Numerator: %d\n", synth->fractionalNumerator);		
		printf("| NUM | NXT | RST | DBL |   LEN |            INC |      BNW |\n");
	}
	
	for (int i = 0; i < MAX_RAMPS; i++)
	{
		//limit the maximum ramp length to prevent overflow
		if (synth->ramps[i].length > MAX_RAMP_LENGTH)
		{
			cprint("[!!] ", BRIGHT, RED);
			printf("Synth %i, ramp %i length set to maximum.\n", synth->number, i);
			synth->ramps[i].length = (uint16_t)MAX_RAMP_LENGTH;			
		}
		
		//calculate increment = (bandwidth [Hz] * (2^24 - 1))/(phase detector frequency [MHz] * ramp_length)
		if ((synth->ramps[i].length != 0) && (synth->ramps[i].increment == 0))
		{
			synth->ramps[i].increment = (synth->ramps[i].bandwidth*4*FRAC_DENOMINATOR)/(PHASE_DETECTOR_FREQ*synth->ramps[i].length);			
		}
		
		//limit the maximum ramp increment to prevent overflow
		if (synth->ramps[i].increment > MAX_RAMP_INC)
		{
			cprint("[!!] ", BRIGHT, RED);
			printf("Synth %i, ramp %i increment set to maximum.\n", synth->number, i);
			synth->ramps[i].length = (uint16_t)MAX_RAMP_INC;			
		}		
		
		//perform two's complement for negative values: 2^30 - value  
		if (synth->ramps[i].increment < 0.0)
		{
			synth->ramps[i].increment = pow(2, 30) + synth->ramps[i].increment; //TODO: check this!
		}		
		
		//set bit 31 if doubler key is true
		if (synth->ramps[i].doubler)
		{
			synth->ramps[i].increment = (uint64_t)synth->ramps[i].increment | (uint64_t)pow(2, 31);	
		}
		
		//scheme to generate next-trigger-reset for R92, R96, R103 etc.. 
		synth->ramps[i].ntr = 0;
		
		synth->ramps[i].ntr += (synth->ramps[i].next << 5) & 0xFF;
		synth->ramps[i].ntr += (synth->ramps[i].trigger << 3) & 0xFF;
		synth->ramps[i].ntr += (synth->ramps[i].reset << 2) & 0xFF;
		synth->ramps[i].ntr += (synth->ramps[i].flag << 0) & 0xFF;
		
		if ((config->is_debug) && (synth->ramps[i].next + synth->ramps[i].length + synth->ramps[i].increment + synth->ramps[i].reset != 0))
		{
			printf("|   %i |   %i |   %i |   %i | %5i | %14.3f | %8.3f |\n", 
			synth->ramps[i].number, synth->ramps[i].next, synth->ramps[i].reset, synth->ramps[i].doubler, synth->ramps[i].length, 
			synth->ramps[i].increment, bnwOut(synth->ramps[i].increment, synth->ramps[i].length));
		}		
	}	
	if (config->is_debug) printf("\n");
	
	//calculate the equivalent binary values
	synth->binFractionalNumerator = (int*)malloc(24*sizeof(int));
	memset(synth->binFractionalNumerator, 0, 24*sizeof(int));
	decimalToBinary(synth->fractionalNumerator, synth->binFractionalNumerator);	
	
	for (int i = 0; i < MAX_RAMPS; i++)
	{	
		synth->ramps[i].binIncrement     = (int*)malloc(32*sizeof(int));
		synth->ramps[i].binLength        = (int*)malloc(16*sizeof(int));	
		synth->ramps[i].binNextTrigReset = (int*)malloc(8*sizeof(int));		
		
		memset(synth->ramps[i].binIncrement, 	 0, 32*sizeof(int));
		memset(synth->ramps[i].binLength, 		 0, 16*sizeof(int));
		memset(synth->ramps[i].binNextTrigReset, 0,  8*sizeof(int));		
		
		decimalToBinary(synth->ramps[i].increment, synth->ramps[i].binIncrement);
		decimalToBinary(synth->ramps[i].length, synth->ramps[i].binLength);
		decimalToBinary(synth->ramps[i].ntr, synth->ramps[i].binNextTrigReset);	
	}
}


void reset_synths(void* gpio, Synthesizer *tx_synth, Synthesizer *lo_synth)
{
	set_register_parallel(gpio, tx_synth, lo_synth, 2, 0b00000100);
}


void set_ramping(void* gpio, Synthesizer *tx_synth, Synthesizer *lo_synth, bool is_ramping)
{
	if (is_ramping)
		set_register_parallel(gpio, tx_synth, lo_synth, 58, 0b00010001); //note: this value assumes RAMP_TRIG_A = TRIG1 terminal rising edge
	else
		set_register_parallel(gpio, tx_synth, lo_synth, 58, 0b00010000); //note: this value assumes RAMP_TRIG_A = TRIG1 terminal rising edge
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


void load_registers(const char* filename, Synthesizer *synth)
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

	fclose(templateFile);

	//for every ramp
	for (int i = 7; i >= 0; i--)
	{
		//for every bit
		for (int j = 7; j >= 0; j--)
		{
			synth->registers[92 + 7*i][j] = synth->ramps[i].binNextTrigReset[j];
		}

		//for every bit
		for (int j = 15; j >= 8; j--)
		{
			synth->registers[91 + 7*i][j - 8] = synth->ramps[i].binLength[j];
		}

		//for every bit
		for (int j = 7; j >= 0; j--)
		{
			synth->registers[90 + 7*i][j] = synth->ramps[i].binLength[j];
		}
		
		//for every bit
		for (int j = 31; j >= 24; j--)
		{
			synth->registers[89 + 7*i][j - 24] = synth->ramps[i].binIncrement[j];
		}
		
		//for every bit
		for (int j = 23; j >= 16; j--)
		{
			synth->registers[88 + 7*i][j - 16] = synth->ramps[i].binIncrement[j];
		}		
		
		//for every bit
		for (int j = 15; j >= 8; j--)
		{
			synth->registers[87 + 7*i][j - 8] = synth->ramps[i].binIncrement[j];
		}
		
		//for every bit
		for (int j = 7; j >= 0; j--)
		{
			synth->registers[86 + 7*i][j] = synth->ramps[i].binIncrement[j];
		}
		
		
	}
	
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
}


void init_pins(Synthesizer *synth)
{
	synth->latch = (uint64_t)(1 << (0 + 4*synth->number));
	synth->data  = (uint64_t)(1 << (1 + 4*synth->number));
	synth->clock = (uint64_t)(1 << (2 + 4*synth->number));
	synth->trig  = (uint64_t)(1 << (3 + 4*synth->number));
}


void set_register(void* gpio, Synthesizer *synth, int address, int value)
{
	int binAddress[16];
	int binValue[8];
	
	memset(binAddress, 0, 16*sizeof(int));
	memset(binValue, 0, 8*sizeof(int));
	
	decimalToBinary(address, binAddress);	
	decimalToBinary(value, binValue);
 
	set_pin(gpio, synth->latch, HIGH); 			//set latch high
	usleep(1);
	set_pin(gpio, synth->clock, HIGH);			//set clock high
	usleep(1);
	set_pin(gpio, synth->latch, LOW); 			//set latch low
	usleep(1);
	set_pin(gpio, synth->data, LOW); 			//set data low
	usleep(1);
	set_pin(gpio, synth->clock, LOW);			//set clock low
	usleep(1);

	for (int j = 15; j >= 0 ; j--)
	{
		if (binAddress[j] == 1)
			set_pin(gpio, synth->data, HIGH); 	//set data high
		else
			set_pin(gpio, synth->data, LOW); 	//set data low
			
		usleep(1);	
		set_pin(gpio, synth->clock, HIGH);		//set clock high
		usleep(1);
		set_pin(gpio, synth->clock, LOW);		//set clock low		
		usleep(1);
	}			
	
	//Write register data
	for(int j = 7; j >= 0; j--)
	{
		if (binValue[j] == 1)
			set_pin(gpio, synth->data, HIGH); 	//set data high
		else
			set_pin(gpio, synth->data, LOW); 	//set data low
		
		usleep(1);	
		set_pin(gpio, synth->clock, HIGH);		//set clock high
		usleep(1);
		set_pin(gpio, synth->clock, LOW);		//set clock low		
		usleep(1);
	}
	
	set_pin(gpio, synth->latch, HIGH); 			//set latch high
	usleep(1);
	set_pin(gpio, synth->data, LOW); 			//set data low
}


void set_register_parallel(void* gpio, Synthesizer *tx_synth, Synthesizer *lo_synth, int address, int value)
{
	int binAddress[16];
	int binValue[8];
	
	memset(binAddress, 0, 16*sizeof(int));
	memset(binValue, 0, 8*sizeof(int));
	
	decimalToBinary(address, binAddress);	
	decimalToBinary(value, binValue);
 
	set_pin(gpio, (tx_synth->latch | lo_synth->latch), HIGH); 			//set latch high
	usleep(1);
	set_pin(gpio, (tx_synth->clock | lo_synth->clock), HIGH);			//set clock high
	usleep(1);
	set_pin(gpio, (tx_synth->latch | lo_synth->latch), LOW); 			//set latch low
	usleep(1);
	set_pin(gpio, (tx_synth->data | lo_synth->data), LOW); 				//set data low
	usleep(1);
	set_pin(gpio, (tx_synth->clock | lo_synth->clock), LOW);			//set clock low
	usleep(1);

	for (int j = 15; j >= 0 ; j--)
	{
		if (binAddress[j] == 1)
			set_pin(gpio, (tx_synth->data | lo_synth->data), HIGH); 	//set data high
		else
			set_pin(gpio, (tx_synth->data | lo_synth->data), LOW); 		//set data low
			
		usleep(1);	
		set_pin(gpio, (tx_synth->clock | lo_synth->clock), HIGH);		//set clock high
		usleep(1);
		set_pin(gpio, (tx_synth->clock | lo_synth->clock), LOW);		//set clock low		
		usleep(1);
	}			
	
	//Write register data
	for(int j = 7; j >= 0; j--)
	{
		if (binValue[j] == 1)
			set_pin(gpio, (tx_synth->data | lo_synth->data), HIGH); 	//set data high
		else
			set_pin(gpio, (tx_synth->data | lo_synth->data), LOW); 		//set data low
		
		usleep(1);	
		set_pin(gpio, (tx_synth->clock | lo_synth->clock), HIGH);		//set clock high
		usleep(1);
		set_pin(gpio, (tx_synth->clock | lo_synth->clock), LOW);		//set clock low		
		usleep(1);
	}
	
	set_pin(gpio, (tx_synth->latch | lo_synth->latch), HIGH); 			//set latch high
	usleep(1);
	set_pin(gpio, (tx_synth->data | lo_synth->data), LOW); 				//set data low	
}

void flash_synth(void* gpio, Synthesizer *synth)
{
	int start_address[16];
	memset(start_address, 0, 16*sizeof(int));
	decimalToBinary((NUM_REGISTERS - 1), start_address);
	
	int address_flag = false;
	
	for (int i = (NUM_REGISTERS - 1); i >= 0; i--)
	{
		if (address_flag == false)
		{
			set_pin(gpio, synth->latch, HIGH); 			//set latch high
			usleep(1);
			set_pin(gpio, synth->clock, HIGH);			//set clock high
			usleep(1);
			set_pin(gpio, synth->latch, LOW); 			//set latch low
			usleep(1);
			set_pin(gpio, synth->data, LOW); 			//set data low
			usleep(1);
			set_pin(gpio, synth->clock, LOW);			//set clock low
			usleep(1);

			for (int j = 15; j >= 0 ; j--)
			{
				if (start_address[j] == 1)
					set_pin(gpio, synth->data, HIGH); 	//set data high
				else
					set_pin(gpio, synth->data, LOW); 	//set data low
					
				usleep(1);	
				set_pin(gpio, synth->clock, HIGH);		//set clock high
				usleep(1);
				set_pin(gpio, synth->clock, LOW);		//set clock low		
				usleep(1);
			}			
			
			//Only do this the first loop iteration, set address_flag
			address_flag = true;
		}

		//Write register data
		for(int j = 7; j >= 0; j--)
		{
			if (synth->registers[i][j] == 1)
				set_pin(gpio, synth->data, HIGH); 		//set data high
			else
				set_pin(gpio, synth->data, LOW); 		//set data low
			
			usleep(1);	
			set_pin(gpio, synth->clock, HIGH);			//set clock high
			usleep(1);
			set_pin(gpio, synth->clock, LOW);			//set clock low		
			usleep(1);
		}
	}
	
	set_pin(gpio, synth->latch, HIGH); 					//set latch high
	usleep(1);
	set_pin(gpio, synth->data, LOW); 					//set data low
}
 
 
void flash_synths(void* gpio, Synthesizer *tx_synth, Synthesizer *lo_synth)
{
	int start_address[16];
	memset(start_address, 0, 16*sizeof(int));
	decimalToBinary((NUM_REGISTERS - 1), start_address);
	
	int address_flag = false;
	
	for (int i = (NUM_REGISTERS - 1); i >= 0; i--)
	{
		if (address_flag == false)
		{
			set_pin(gpio, (tx_synth->latch | lo_synth->latch), HIGH); 			//set latch high
			usleep(1);
			set_pin(gpio, (tx_synth->clock | lo_synth->clock), HIGH);			//set clock high
			usleep(1);
			set_pin(gpio, (tx_synth->latch | lo_synth->latch), LOW); 			//set latch low
			usleep(1);
			set_pin(gpio, (tx_synth->data | lo_synth->data), LOW); 				//set data low
			usleep(1);
			set_pin(gpio, (tx_synth->clock | lo_synth->clock), LOW);			//set clock low
			usleep(1);

			for (int j = 15; j >= 0 ; j--)
			{
				if (start_address[j] == 1)
					set_pin(gpio, (tx_synth->data | lo_synth->data), HIGH); 	//set data high
				else
					set_pin(gpio, (tx_synth->data | lo_synth->data), LOW); 		//set data low
					
				usleep(1);	
				set_pin(gpio, (tx_synth->clock | lo_synth->clock), HIGH);		//set clock high
				usleep(1);
				set_pin(gpio, (tx_synth->clock | lo_synth->clock), LOW);		//set clock low		
				usleep(1);
			}			
			
			//Only do this the first loop iteration, set address_flag
			address_flag = true;
		}

		//Write register data
		for(int j = 7; j >= 0; j--)		
		{
			if ((tx_synth->registers[i][j] == 1) && (lo_synth->registers[i][j] == 1))
			{
				set_pin(gpio, (tx_synth->data | lo_synth->data), HIGH); 		//set data high
			}
			else if ((tx_synth->registers[i][j] == 0) && (lo_synth->registers[i][j] == 0))
			{	
				set_pin(gpio, (tx_synth->data | lo_synth->data), LOW); 			//set data low
			}
			else if ((tx_synth->registers[i][j] == 1) && (lo_synth->registers[i][j] == 0))
			{	
				set_pin(gpio, (tx_synth->data), HIGH); 			//set data low
				set_pin(gpio, (lo_synth->data), LOW); 			//set data low
			}	
			else if ((tx_synth->registers[i][j] == 0) && (lo_synth->registers[i][j] == 1))
			{	
				set_pin(gpio, (tx_synth->data), LOW); 			//set data low
				set_pin(gpio, (lo_synth->data), HIGH); 			//set data low
			}		
			
			usleep(1);	
			set_pin(gpio, (tx_synth->clock | lo_synth->clock), HIGH);			//set clock high
			usleep(1);
			set_pin(gpio, (tx_synth->clock | lo_synth->clock), LOW);			//set clock low		
			usleep(1);
		}
	}
	
	set_pin(gpio, (tx_synth->latch | lo_synth->latch), HIGH); 			//set latch high
	usleep(1);
	set_pin(gpio, (tx_synth->data | lo_synth->data), LOW); 				//set data low
} 
 
 
void trigger_synths(void* gpio)
{
	int freq_divisor = ADC_RATE/PRF;
	uint32_t trigger  = 0;
	
	trigger |= (1 << 8); 			//set enable flag
	trigger |= (freq_divisor << 9); //set divisor value
	
	set_reg(gpio, LOW);
	set_reg(gpio, trigger);
}


void config_experiment(Configuration *config, Synthesizer *tx_synth, Synthesizer *lo_synth)
{
	//read-write mode
	system("rw\n");

	//allocate memory 
	config->time_stamp = (char*)malloc(20*sizeof(char));
	config->dir_experiment = (char*)malloc(100*sizeof(char));
	config->path_imu = (char*)malloc(100*sizeof(char));
	config->path_summary = (char*)malloc(100*sizeof(char));
	
	//get the experiment time stamp
	time_t timer = time(&timer);
    struct tm* tm_info  = localtime(&timer);
	strftime(config->time_stamp, 20, "%d_%m_%y_%H_%M_%S", tm_info);
	
	//set the experiment directory
	sprintf(config->dir_experiment, "%s/%s/", config->dir_storage, config->time_stamp);
	
	//set the imu data file path
	sprintf(config->path_imu, "%s%s", config->dir_experiment, "imu.bin");
	
	//set the summary file path
	sprintf(config->path_summary, "%s%s", config->dir_experiment, "summary.ini");
	
	//make the experiment directory
	char command[100];
	sprintf(command, "mkdir %s/%s", config->dir_storage, config->time_stamp);		
	system(command);
	
	FILE* f;
	f = fopen(config->path_summary, "w");
	
	//Check if file correctly opened
	if (f == 0)
    {
		cprint("[!!] ", BRIGHT, RED);
		printf("Could not open summary file. Ensure you have read-write access\n");
    }
	else
    {
		//copy ini parameter files
		sprintf(command, "cp ramps/%s %s", tx_synth->param_file, config->dir_experiment);
		system(command);
		
		if (tx_synth->param_file != lo_synth->param_file)
		{
			sprintf(command, "cp ramps/%s %s", lo_synth->param_file, config->dir_experiment); 
			system(command);
		}
		
		//print summary file 
		fprintf(f, "[general]\r\n");
		fprintf(f, "time_stamp = %s\r\n", config->time_stamp);
		
		cprint("[??] ", BRIGHT, BLUE);
		printf("Operator Comment [140]: ");
		char userin[140];
		scanf("%[^\n]s", userin);
		
		fprintf(f, "operator_comment = %s\r\n", userin);
		
		fprintf(f, "\n[dataset]\r\n");
		fprintf(f, "decimation_factor = %d\r\n", config->decimation);
		fprintf(f, "sampling_rate = %.2f\r\n", ADC_RATE/config->decimation);
		fprintf(f, "n_counter = %i\r\n", N_COUNTER);
		fprintf(f, "prf = %i\r\n", PRF);
	
		
		fprintf(f, "\n[synth_one]\r\n");
		fprintf(f, "frequency_offset = %.5f\r\n", vcoOut(tx_synth->fractionalNumerator));
		fprintf(f, "fractional_numerator = %d\r\n", tx_synth->fractionalNumerator);		
		
		fprintf(f, "\n[synth_two]\r\n");
		fprintf(f, "frequency_offset = %.5f\r\n", vcoOut(lo_synth->fractionalNumerator));
		fprintf(f, "fractional_numerator = %d\r\n", lo_synth->fractionalNumerator);		

		fclose(f);
	}	
}


double vcoOut(uint32_t fractional_numerator)
{
	return PHASE_DETECTOR_FREQ*(N_COUNTER + fractional_numerator/FRAC_DENOMINATOR)/RF_OUT_DIVIDER - RF_OUT_INIT_FREQ;
}


double bnwOut(double rampInc, uint16_t rampLen)
{
	if (rampInc < (pow(2, 24) - 1))
		return (rampInc*rampLen*100)/pow(2, 26);
	else
		return ((rampInc - pow(2, 30))*rampLen*100)/pow(2, 26);
}









