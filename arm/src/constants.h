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
	int is_debug_mode;					//is debug mode enabled
	//int adc_channel;					//adc channel to record on
	int decFactor; 						//adc decimation factor
	int u_max_loop;		 				//maximum loop period in microseconds
	int n_flags;						//number of flags detected
	int n_corrupt;						//number of ramps which contain partly new and partly old data
	int n_missed;						//number of flags missed 
	int n_ramps;						//number of ramps to be recorded
	char* storageDir; 					//path to storage directory
	char* timeStamp;					//experiment timestamp
	char* ch1_filename; 				//filename of output data including path
	char* ch2_filename; 				//filename of output data including path
	char* imu_filename; 				//filename of output data including path
	char* summary_filename; 			//filename of summary file including path
	double outputSize; 				//recoring size [MB]
	uint32_t ns_ext_buffer;				//number of samples to capture from adc on external channel
	uint32_t ns_ref_buffer;				//number of samples to capture from adc on reference channel
} Configuration;

#endif
