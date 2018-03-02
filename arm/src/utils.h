#ifndef UTILS_H
#define UTILS_H

#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <stdint.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <math.h>

#include "constants.h"

void ASSERT(int, char * message);
int init_mem(void);
int dnit_mem(void);
int create_map(size_t size, size_t map_flags, void** mapped, size_t offset);
int destroy_map(size_t size, void** mapped);

void init_channel(Channel** channel, char letter, uint32_t dma_base, uint32_t sts_base);
void dnit_channel(Channel** channel);

void write_prop(char *tag, char *message);
void write_prop_l(char *tag, long long message);
void write_prop_h(char *tag, long long message);
void write_prop_f(char *tag, float message);

int init_prop(void);
int dnit_prop(void);

uint32_t get_phase_increment(double desired_frequency);
uint32_t get_phase_offset(double desired_offset);

double elapsed_us(struct timeval start_time, struct timeval end_time);

#endif

