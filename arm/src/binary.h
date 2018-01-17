#ifndef BINARY_H
#define BINARY_H

#include <stdint.h>
#include <stdio.h>
#include <unistd.h>		
#include <fcntl.h>			
#include <termios.h>		
#include <errno.h>
#include <math.h>
#include <stdlib.h>

#include "colour.h"

uint32_t bit8ArrayToBit32(uint8_t *data);
float bit32ToFloat(uint32_t bit32);
float bit8ArrayToFloat(uint8_t *data);
uint8_t checkBit(uint32_t reg, uint8_t bit);

#endif
