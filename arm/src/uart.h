#ifndef UM7_UART_H
#define UM7_UART_H

#include <stdint.h>
#include <stdio.h>
#include <unistd.h>		
#include <fcntl.h>			
#include <termios.h>		
#include <errno.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

#include "colour.h"

#define UART_BUFFER_SIZE 200

void initUART(speed_t baud);
int dnitUART(void);
int getUART(void);
int getFileID(void);
void clearUART(void);

#endif
