#ifndef CONSTANTS
#define CONSTANTS
#include <pthread.h>
#include <math.h>

#include "setup.h"

//Set Operating Constants
#define ADC_RATE 			125e6
#define DAC_RATE 			125e6
#define DAC_BUFFER_CAPACITY 4096
#define DAC_BIT_LENGTH 		14
#define DDS_PHASE_WIDTH		32
#define DDS_PHASE_OFFSET	0
#define DECIMATION_FACTOR	8

//Set Common Data Sizes
#define S2MB (2 << 20) //2MB
#define S4MB (4 << 20) //4MB
#define SREG (4 << 10) //4KB

//Set Commonly Used Registers
#define CFG_BASE_ADDR 	0x40000000
#define STS_A_BASE_ADDR 0x40001000
#define STS_B_BASE_ADDR 0x40002000
#define GEN_BASE_ADDR 	0x40003000
#define GPIO_BASE_ADDR 	0x40004000
#define CANC_BASE_ADDR 	0x40005000
#define PHSE_BASE_ADDR 	0x40006000

#define DMA_A_BASE_ADDR 0x1E000000
#define DMA_B_BASE_ADDR 0x1E400000

#define SD_STORAGE_DIR		"/media/storage"
#define SYNTH_REG_TEMP_DIR	"template/register_template.txt"

#define OK 0
#define FAIL -1

#define HIGH 1
#define LOW  0

typedef int bool;
#define true 1
#define false 0

typedef struct Channel_S 
{
	void *dma;
	void *sts;
	uint32_t dma_base;
	uint32_t sts_base;
	char letter[1];
	pthread_t thread;
} Channel;

typedef struct
{
	int is_imu;							//is the IMU connected?
	int is_debug;						//is debug mode enabled
	uint32_t decimation; 				//adc decimation factor
	int n_buffers;						//number of S2MB buffers to be recorded
	
	char* dir_storage; 					//path to storage directory
	char* dir_experiment; 				//path to storage directory
	char* time_stamp;					//experiment timestamp
	
	char* path_imu; 					//filename of output data including path
	char* path_summary; 				//filename of summary file including path
} Configuration;

#endif
