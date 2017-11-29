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

Channel *A, *B;
static void *cfg, *gen, *gpio;

void* record(void *arg) 
{
	Channel *channel = (Channel *) arg;

	#ifdef VERBOSE
	printf("---> Allocating Memory For Channel %s\n", channel->letter);
	#endif
	
	ASSERT(create_map( SREG, MAP_SHARED, &channel->sts, channel->sts_base ), "Failed to allocate map for STS register.");
	ASSERT(create_map( S4MB, MAP_SHARED, &channel->dma, channel->dma_base ), "Failed to allocate map for DMA RAM.");

	memset(channel->dma, 0x0, S4MB);

	int position, limit, offset;

	char * dir = "/media/storage/recording.";
	char * path = malloc(strlen(dir) + strlen(channel->letter) + 1 + 4);
	strcpy(path, dir);
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
 
int main(int argc, char **argv)
{
	setpriority(PRIO_PROCESS, 0, -20);
	
	ASSERT(init_mem(), "Failed to open /dev/mem.");
	ASSERT(init_prop(), "Failed to create properties file");
	
	ASSERT(create_map(SREG, MAP_SHARED, &cfg, CFG_BASE_ADDR), "Failed to allocate map for CFG register.");
	ASSERT(create_map(SREG, MAP_SHARED, &gen, GEN_BASE_ADDR), "Failed to allocate map for GEN register.");	
	ASSERT(create_map(SREG, MAP_SHARED, &gpio, GPIO_BASE_ADDR), "Failed to allocate map for GPIO register.");	
	
	uint32_t decimation = 0x00080000;
	set_reg(cfg, decimation);
	
	//set dds phase increment
	double freq_out = 1e6;
	double phase_wth  = 30;
	int phase_inc = (int)round(freq_out*pow(2.0, phase_wth)/DAC_RATE);	
	set_reg(gen, phase_inc);
	
	//clear gpio pins
	set_reg(gpio, 0);
	
	//set gpio pins
	set_pin(gpio, DIO7_N, HIGH);	

	init_channel(&A, 'A', DMA_A_BASE_ADDR, STS_A_BASE_ADDR);
	init_channel(&B, 'B', DMA_B_BASE_ADDR, STS_B_BASE_ADDR);

	pthread_create(&A->thread, NULL, record, (void *) A);
	pthread_create(&B->thread, NULL, record, (void *) B);

	write_prop_h("CFG REG", get_reg(cfg));
	write_prop_h("GEN REG", get_reg(gen));

	pthread_join(A->thread, NULL);
	pthread_join(B->thread, NULL);
 
    return 0;	
}
