#ifndef __REG_H
#define __REG_H

#define DIO0_N	(uint64_t)(1 << 0)
#define DIO1_N	(uint64_t)(1 << 1)
#define DIO2_N	(uint64_t)(1 << 2)
#define DIO3_N	(uint64_t)(1 << 3)
#define DIO4_N	(uint64_t)(1 << 4)
#define DIO5_N	(uint64_t)(1 << 5)
#define DIO6_N	(uint64_t)(1 << 6)
#define DIO7_N	(uint64_t)(1 << 7)

#define DIO0_P	(uint64_t)(1 << 8)
#define DIO1_P	(uint64_t)(1 << 9)
#define DIO2_P	(uint64_t)(1 << 10)
#define DIO3_P	(uint64_t)(1 << 11)
#define DIO4_P	(uint64_t)(1 << 12)
#define DIO5_P	(uint64_t)(1 << 13)
#define DIO6_P	(uint64_t)(1 << 14)
#define DIO7_P	(uint64_t)(1 << 15)

#define TRIGGER (0b10000000010001000)

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

//Method Specifically For GPIO Register
void set_pin(void *gpio, uint64_t pin, int state);

//Method Specifically For Generator Register
void set_frequency(void *gen, double freq_A, double freq_B);
void set_phasor(void *gen, double phase_A, double phase_B);

//Method Specifically For Quad Demodulator
void set_quad_freq(void *qua, double freq, double quad_off);

//Method Specifically For Dropping Initial Packets
void set_drop_amount(void *cfg, uint16_t amount);


#endif
