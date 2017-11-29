#ifndef COLOUR_H
#define COLOUR_H

#include <stdio.h>

#define RESET           0
#define BRIGHT          1
#define DIM             2
#define UNDERLINE       3
#define BLINK           4
#define REVERSE         7
#define HIDDEN          8
 
#define BLACK           0
#define RED             1
#define GREEN           2
#define YELLOW          3
#define BLUE            4
#define MAGENTA         5
#define CYAN            6
#define GREY            7
#define WHITE           8

void cprint(const char* text, int attr, int fg);

#endif
