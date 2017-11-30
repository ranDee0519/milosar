#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/resource.h>
#include <fcntl.h>
#include <stdlib.h>
#include "reg.h"
#include "utils.h"
#include "constants.h"
#include "synth.h"

void parse_options(int argc, char *argv[]);
void help(void);
void* record(void *arg); 

Channel *A, *B;
Synthesizer tx_synth, lo_synth;
Configuration config;

static void *cfg, *gen, *gpio;

int main(int argc, char **argv)
{
	//initialise default values
	tx_synth.number = 0;
	lo_synth.number = 1;
	tx_synth.param_file = false;
	lo_synth.param_file = false;
	config.dir_storage = "/media/storage";
	config.is_debug = false;
	
	//parse command line options
	parse_options(argc, argv);
	
	//load synth ramp parameters from .ini files
	load_ramp_file(&tx_synth);
	load_ramp_file(&lo_synth);
	
	//calculate additional ramp parameters
	calc_parameters(&tx_synth, &config);
	calc_parameters(&lo_synth, &config);	
	
	//import register values from template file
	load_registers("template/register_template.txt", &tx_synth);
	load_registers("template/register_template.txt", &lo_synth);	
	
	setpriority(PRIO_PROCESS, 0, -20);
	system("pkill nginx\n");
	
	ASSERT(init_mem(), "Failed to open /dev/mem.");
	
	ASSERT(create_map(SREG, MAP_SHARED, &cfg, CFG_BASE_ADDR), "Failed to allocate map for CFG register.");
	ASSERT(create_map(SREG, MAP_SHARED, &gen, GEN_BASE_ADDR), "Failed to allocate map for GEN register.");	
	ASSERT(create_map(SREG, MAP_SHARED, &gpio, GPIO_BASE_ADDR), "Failed to allocate map for GPIO register.");	
	
	uint32_t decimation = 0x00080000;
	set_reg(cfg, decimation);
	
	//set all gpio pins low
	set_reg(gpio, LOW);
	
	//init synth pins
	init_pins(&tx_synth);
	init_pins(&lo_synth);
	
	//software reset the synths
	reset_synth(gpio, &tx_synth);
	reset_synth(gpio, &lo_synth);
	
	//write to the synth registers
	flash_synth(gpio, &tx_synth);
	flash_synth(gpio, &lo_synth);
	
	//now that synth parameters have been set
	enable_ramping(gpio, &tx_synth, true);
	enable_ramping(gpio, &lo_synth, true);
	
	//get user input for final experiment settings
	config_experiment(&config, &tx_synth, &lo_synth);
	
	init_channel(&A, 'A', DMA_A_BASE_ADDR, STS_A_BASE_ADDR);
	init_channel(&B, 'B', DMA_B_BASE_ADDR, STS_B_BASE_ADDR);

	pthread_create(&A->thread, NULL, record, (void *) A);
	pthread_create(&B->thread, NULL, record, (void *) B);
	
	//set dds phase increment
	double freq_out = PHASE_DETECTOR_FREQ/2;
	double phase_wth  = 30;
	int phase_inc = (int)round(freq_out*pow(2, phase_wth)/DAC_RATE);	
	set_reg(gen, phase_inc);
	
	trigger_synths(gpio, &tx_synth, &lo_synth);

	pthread_join(A->thread, NULL);
	pthread_join(B->thread, NULL);
	
	enable_ramping(gpio, &tx_synth, false);
	enable_ramping(gpio, &lo_synth, false);
	
	if (config.is_debug)
	{
		cprint("[**] ", BRIGHT, CYAN);
		printf("Enter host password to transfer files:\n");
		
		//copy experiment folder from red pitaya to host computer
		char command[100];
		sprintf(command, "scp -r %s/%s darryn@10.42.0.1:/home/darryn/Dropbox/Datasets/Temp", config.dir_storage, config.time_stamp);		
		system(command);
	}
 
    return 0;	
}


void parse_options(int argc, char *argv[])
{
	int opt;
	int is_tx_synth = 0;
	int is_lo_synth = 0;

    while ((opt = getopt(argc, argv, "dib:t:l:rh")) != -1 )
    {
        switch (opt)
        {
            case 'd':
                config.is_debug = true;
                break;
            case 'r':
                config.dir_storage = "/tmp";
                break;       
            case 'i':
                config.is_imu = true;
                break;
			case 'b':
				tx_synth.param_file = optarg;
				lo_synth.param_file = optarg;
				is_tx_synth = 2;
				break;
			case 'l':
				lo_synth.param_file = optarg;
				is_lo_synth = 1;
				break;
			case 't':
				tx_synth.param_file = optarg;
				is_tx_synth = 1;
				break;
			case 'h':
				help();
				break;
            case '?':
				ASSERT(FAIL, "unknown command line option");
        }        
    }
    
    if (is_lo_synth + is_tx_synth != 2)
    {
		cprint("[!!] ", BRIGHT, RED);
		printf("A .ini parameter file must be provided for each synthesizer.\n");
		exit(EXIT_FAILURE);
	}
}


void* record(void *arg) 
{
	Channel *channel = (Channel *) arg;

	#ifdef VERBOSE
	printf("---> Allocating Memory For Channel %s\n", channel->letter);
	#endif
	
	ASSERT(create_map( SREG, MAP_SHARED, &channel->sts, channel->sts_base ), "Failed to allocate map for STS register.");
	ASSERT(create_map( S4MB, MAP_SHARED, &channel->dma, channel->dma_base ), "Failed to allocate map for DMA RAM.");

	//clear ram
	memset(channel->dma, 0x0, S4MB);

	int position, limit, offset;

	char * path = malloc(strlen(config.dir_experiment) + strlen(channel->letter) + 1 + 4);
	strcpy(path, config.dir_experiment);
	strcat(path, channel->letter);
	strcat(path, ".bin");

	FILE *f = fopen(path, "w");
	limit = S2MB;

	#ifdef CONTINUOUS_TRANSMISSION
	sleep(100000);
	#endif
	
	int nbuffs = 0;

	while (nbuffs < 1) 
	{
		//Get the location of the DMA writer in terms of number of bytes written.
		position = get_reg(channel->sts) * 4;

		//Safe To Read Bottom                 //Safe To Read Top
		if((limit > 0 && position > limit) || (limit == 0 && position < S2MB)){

			offset = limit > 0 ? 0 : S2MB;
			limit = limit > 0 ? 0 : S2MB;			
			fwrite(channel->dma + offset, 1, S2MB , f);
			nbuffs++;
		} 
    }

    fclose(f);
	free(path);

    #ifdef VERBOSE
    printf("---> Finished Channel %s \n", channel->letter);
    #endif

    return 0;
}


void help(void)
{
	printf(" -h: display this help screen\n");
	printf(" -d: enable debug mode\n");
	printf(" -i: enable imu mode\n");
	printf(" -l: name of local oscillator (lo) synth parameter file\n");
	printf(" -t: name of radio frequency (rf) synth parameter file\n");
	printf(" -r: write output files to /tmp\n");
	exit(EXIT_SUCCESS);	
}
