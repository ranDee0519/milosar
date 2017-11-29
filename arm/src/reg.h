#ifndef __REG_H
#define __REG_H

#include <stdint.h>
#include <stdio.h>

//Generic Register Methods
uint64_t get_reg(void *reg);
void set_reg(void *reg, uint64_t val);

//Flag Orientated Methods
void dis_reg(void *reg, uint64_t flag);
void enb_reg(void *reg, uint64_t flag);
void clc_reg(void *reg);

//Method Specifically For Configuration Register
void set_led(void *cfg, uint8_t value);
void set_decimation(void *cfg, uint8_t value);

//Method Specifically For Generator Register
void set_frequency(void *gen, double freq_A, double freq_B);
void set_phasor(void *gen, double phase_A, double phase_B);

//Method Specifically For Quad Demodulator
void set_quad_freq(void *qua, double freq, double quad_off);

//Method Specifically For Dropping Initial Packets
void set_drop_amount(void *cfg, uint16_t amount);


#endif
