#ifndef CONSTANTS
#define CONSTANTS
#include <pthread.h>
#include "setup.h"

//Set Operating Constants
#define ADC_RATE 125e6
#define DAC_RATE 125e6
#define DAC_BUFFER_CAPACITY 4096
#define DAC_BIT_LENGTH 14

//Set Common Data Sizes
#define S2MB (2 << 20) //2MB
#define S4MB (4 << 20) //4MB
#define SREG (4 << 10) //4KB

//Set Commonly Used Registers
#define CFG_BASE_ADDR 0x40000000
#define STS_A_BASE_ADDR 0x40001000
#define STS_B_BASE_ADDR 0x40002000
#define GEN_BASE_ADDR 0x40003000
#define GPIO_BASE_ADDR 0x40004000
#define DMA_A_BASE_ADDR 0x1E000000
#define DMA_B_BASE_ADDR 0x1E400000

#define OK 0
#define FAIL -1

typedef int bool;
#define true 1
#define false 0

typedef struct Channel_S {
	void *dma;
	void *sts;
	uint32_t dma_base;
	uint32_t sts_base;
	char letter[1];
	pthread_t thread;
} Channel;

#endif