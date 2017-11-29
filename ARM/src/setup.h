#ifndef SETUP_H
#define SETUP_H

#define SYSTEM_ENABLE           (1 << 0)
#define CHANNELS_OVERRIDE       (1 << 1)
#define CHANNELS_PASS           (1 << 2)
#define BUFFER_FLAG             (1 << 3)
#define DIRECT_INPUT_A          (1 << 4)
#define DIRECT_INPUT_B          (1 << 5)
#define ENABLE_WRITE_BACK       (1 << 6)
#define IS_SLAVE_FLAG           (1 << 7)

//Define                        [VERBOSE, CONTINUOUS_TRANSMISSION]
//Define                        [REAL, I_Q]
//Define                        [CHIRP, MONOCHROME, RAMP, UNIT, MARKED, HAMMING]
//Define                        [MAKE_SLAVE]

#define VERBOSE
#define MONOCHROME
#define REAL                    //CLI Enabled
//#define HAMMING               //CLI Enabled
//#define CONTINUOUS_TRANSMISSION

#define SLAVE_START_DELAY       0       //CLI Enabled
#define NBUFFS                  1       //CLI Enabled
#define CENTER_FREQ             10e6    //CLI Enabled
#define BANDWIDTH               0e6     //CLI Enabled
#define CHIRP_DURATION          20e-6   //CLI Enabled
#define PRI_DURATION            20e-6  //CLI Enabled

#define TX_GAP_L                0 //12e-6 - Experimentally Determined
#define TX_GAP_R                0 //14e-6 - Experimentally Determined

#define ADDITIONAL_FLAGS        (0)

//Define I_Q Constants
#define I_OPERATING_FLAGS     (0)
#define I_DECIMATION          20
#define I_PHASE_QUAD_OFFSET   0    //Set the phase offset of the quad demodulator
#define I_PRI_DROP_N_SAMPLES  5    //Use for the filter delay
#define I_START_OFFSET        16   //Delay the turn-on time of the ADC by N samples

//Define Real Constants
#define R_OPERATING_FLAGS     (CHANNELS_PASS)
#define R_DECIMATION          5
#define R_PHASE_QUAD_OFFSET   0
#define R_PRI_DROP_N_SAMPLES  0
#define R_START_OFFSET        0

//Less Common Constants
#define TX_DELAY                0
#define GEN_A_FREQ              1e6
#define GEN_B_FREQ              1e6
#define GEN_A_PHASE             0.0
#define GEN_B_PHASE             90.0
#define START_FREQ              (CENTER_FREQ - BANDWIDTH / 2)
#define END_FREQ                (CENTER_FREQ + BANDWIDTH / 2)

#endif
