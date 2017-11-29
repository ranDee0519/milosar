/*
command to compile:
gcc -O3 adc-test-server.c -o adc-test-server
*/

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <fcntl.h>
#include <math.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <stdlib.h>

#define S2MB (2 << 20) //2MB
#define S4MB (4 << 20) //4MB
#define SREG (4 << 10) //4KB

#define DAC_RATE 125e6

int main ()
{
	int mmapfd;
	int position, limit, offset;
	void *cfg, *sts_a, *sts_b, *ram_a, *ram_b, *dds_a, *exp_n;
	double freq_out, phase_wth;

	if((mmapfd = open("/dev/mem", O_RDWR)) < 0)
	{
		perror("open");
		return 1;
	}

	cfg   = mmap(NULL, SREG, PROT_READ|PROT_WRITE, MAP_SHARED, mmapfd, 0x40000000);
	sts_a = mmap(NULL, SREG, PROT_READ|PROT_WRITE, MAP_SHARED, mmapfd, 0x40001000);
	sts_b = mmap(NULL, SREG, PROT_READ|PROT_WRITE, MAP_SHARED, mmapfd, 0x40002000);
	dds_a = mmap(NULL, SREG, PROT_READ|PROT_WRITE, MAP_SHARED, mmapfd, 0x40003000);
	exp_n = mmap(NULL, SREG, PROT_READ|PROT_WRITE, MAP_SHARED, mmapfd, 0x40004000);
	ram_a = mmap(NULL, S4MB, PROT_READ|PROT_WRITE, MAP_SHARED, mmapfd, 0x1E000000);
	ram_b = mmap(NULL, S4MB, PROT_READ|PROT_WRITE, MAP_SHARED, mmapfd, 0x1E400000);
	
	
	FILE *f = fopen("/media/storage/out.bin", "w");

	limit = S2MB;
	
	int nbuffs = 0;
	
	//set decimation rate
	*((uint32_t*)(cfg)) = 0x00080000;
	
	//set dds phase increment
	freq_out = 1e6;
	phase_wth  = 30;
	int phase_inc = (int)round(freq_out*pow(2.0, phase_wth)/DAC_RATE);
	*((uint32_t*)(dds_a)) = phase_inc;
	
	//set gpio pins
	*((uint32_t*)(exp_n)) = 0xAA;
	

    while (nbuffs < 1)
    {
		/* read ram writer position */
		position = *((uint32_t *)(sts_a)) * 4;

		/* send 4 MB if ready, otherwise sleep 1 ms */
		if((limit > 0 && position > limit) || (limit == 0 && position < S2MB))
		{
			offset = limit > 0 ? 0 : S2MB;
			limit = limit > 0 ? 0 : S2MB;				
			fwrite(ram_a + offset, 1, S2MB , f);
			nbuffs++;
		}
		else
		{
			usleep(1000);
		}
    } 
 
    return 0;
  
}
