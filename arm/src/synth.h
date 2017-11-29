#ifndef SYNTH_H
#define SYNTH_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <unistd.h>
#include <sys/time.h>
#include <time.h>
#include <stdint.h>

#include "constants.h"
#include "ini.h"
#include "utils.h"
#include "colour.h"

#define MAX_RAMPS 8
#define NUM_REGISTERS 142

typedef struct 
{
	uint8_t number;
	uint8_t reset;
	uint8_t next;
	uint8_t trigger;
	uint8_t flag;
	uint8_t doubler;
	
	int nextTriggerReset;
	
	double bandwidth;	
	double increment;
	uint16_t length;		

	char* hexIncrement;
	char* hexLength;
	char* hexNextTrigReset;
	
	int* binIncrement;
	int* binLength;
	int* binNextTrigReset;	
} Ramp;

typedef struct
{
	int   number;
	uint32_t fractionalNumerator;
	int*  binFractionalNumerator;
	int   addressFlag;
	int   registers[NUM_REGISTERS][MAX_RAMPS];
	char* param_file;
	Ramp  ramps[MAX_RAMPS];
	uint64_t latchPin, dataPin, clockPin, trigPin;
} Synthesizer;

int handler(void* user, const char* section, const char* name, const char* value);

void load_parameters(Synthesizer *synth);
void calc_parameters(Synthesizer *synth, Configuration *config);

void generateHexValues(Synthesizer *synth);
void generateBinValues(Synthesizer *synth);

void readTemplateFile(const char* filename, Synthesizer *synth);
void printRegisterValues(Synthesizer *synth);
void insertRampParameters(Synthesizer *synth);

void init_pins(Synthesizer *synth);
void updateRegisters(Synthesizer *synth);
void triggerSynthesizers(Synthesizer *synthOne, Synthesizer *synthTwo);
void parallelTrigger(Synthesizer *synthOne, Synthesizer *synthTwo);
void configureVerbose(Configuration *config, Synthesizer *synthOne, Synthesizer *synthTwo);
void generateClock(void);
void setRegister(Synthesizer *synth, int registerAddress, int registerValue);

void decimalToBinary(uint64_t decimalValue, int* binaryValue);
void printBinary(int* binaryValue, int paddedSize);
int  clean_stdin();

double vcoOut(uint32_t fracNum);
double bnwOut(double rampInc, uint16_t);
double elapsed_us(struct timeval start_time, struct timeval end_time);


#endif
