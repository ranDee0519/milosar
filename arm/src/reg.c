#include "reg.h"
#include "constants.h"
#include "utils.h"
#include <math.h>
#include <stdio.h>

uint64_t get_reg(void *reg){
    return *((uint64_t *) reg);
}

void set_reg(void *reg, uint64_t val){
    *((uint64_t *) reg) = val;
}

void dis_reg(void *reg, uint64_t flag){
    uint64_t current = get_reg(reg);
    set_reg(reg, current & ~flag);
}

void enb_reg(void *reg, uint64_t flag){
    uint64_t current = get_reg(reg);
    set_reg(reg, current | flag);
}

void clc_reg(void *reg){
    set_reg(reg, 0);
}

void set_led(void *cfg, uint8_t value){
    uint64_t led_pattern = value;
    uint64_t current = get_reg(cfg);
    set_reg(cfg, current & 0x00FFFFFFFFFFFFFF);
    set_reg(cfg, current | (led_pattern << (63 - 8 + 1)) );
}

void set_decimation(void *cfg, uint8_t value){
    uint64_t dec_value = value;
    uint64_t current = get_reg(cfg);
    set_reg(cfg, current & 0xFF00FFFFFFFFFFFF);
    set_reg(cfg, current | (dec_value << (63 - 8 - 8 + 1)) );
}

void set_pin(void *gpio, uint64_t pin, int state)
{
	uint64_t current = get_reg(gpio);
	
	if (state == HIGH)
		set_reg(gpio, current | pin);
	else
		set_reg(gpio, current & pin);
}

void set_frequency(void *gen, double freq_A, double freq_B){
    uint64_t current = get_reg(gen);

    uint64_t p = (1 << 16);
    uint64_t phase_inc_A = round((freq_A * p) / ((double) ADC_RATE));
    uint64_t phase_inc_B = round((freq_B * p) / ((double) ADC_RATE));

    write_prop_f("Gen Channel A Frequency (Hz)", ((double) ADC_RATE * phase_inc_A) / p);
    write_prop_f("Gen Channel B Frequency (Hz)", ((double) ADC_RATE * phase_inc_B) / p);

    set_reg(gen, (current & 0xFFFF0000FFFF0000) | phase_inc_A | (phase_inc_B << 32));
}

void set_phasor(void *gen, double phase_A, double phase_B){
    uint64_t current = get_reg(gen);
    phase_A = fmod(phase_A, 360.0);
    phase_B = fmod(phase_B, 360.0);

    int64_t phase_A_write = round((1 << 16) * (phase_A / 360.0));
    int64_t phase_B_write = round((1 << 16) * (phase_B / 360.0));
    write_prop_l("Gen Phase A (degree)", phase_A);
    write_prop_l("Gen Phase B (degree)", phase_B);

    set_reg(gen, (current & 0x0000FFFF0000FFFF) | (phase_A_write << 16) | (phase_B_write << 48));
}

void set_quad_freq(void *qua, double freq, double phase_off){
    uint64_t p = pow(2, 32);
    uint64_t phase_inc = round((freq * p) / ((double) ADC_RATE));
 	phase_off = fmod(phase_off, 360.0);
    uint64_t phase_val = round(p * (phase_off / 360.0));
    set_reg(qua, (phase_val << 32) | phase_inc);
    write_prop_f("Quad Frequency (Hz)", (phase_inc * ADC_RATE / ((double) p)));
    write_prop_f("Quad Phase Offset (degree)", phase_val * 360.0 / p);
}

void set_drop_amount(void *cfg, uint16_t amount){
    uint64_t value = amount;
    uint64_t current = get_reg(cfg);
    current = current & 0xFFFF0000FFFFFFFF;
    set_reg(cfg, current | (value << (63 - 8 - 8 - 16 + 1)));
    write_prop_l("Start PRI N Samples Dropped", amount);
}



