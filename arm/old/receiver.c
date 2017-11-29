#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <fcntl.h>
#include <math.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <pthread.h>
#include "utils.h"
#include "reg.h"
#include "constants.h"

Channel_Params *A;
Channel_Params *B;
static void *cfg, *gen, *sof, *qua, *pri, *dag, *gal, *gar, *sla;
static uint16_t nbuffs;

void exit_handler(int sig) {
  #ifdef VERBOSE
  printf("---> Placed System Into Idle\n");
  #endif

  clc_reg(cfg);
  ASSERT(dnit_mem(), "Failed to deallocate /dev/mem.");
  ASSERT(destroy_map(SREG, &cfg), "Failed to deallocate CFG memory.");
  ASSERT(destroy_map(SREG, &gen), "Failed to deallocate GEN memory.");
  ASSERT(destroy_map(SREG, &dag), "Failed to deallocate DAG memory.");
  ASSERT(destroy_map(SREG, &pri), "Failed to deallocate PRI memory.");
  ASSERT(destroy_map(SREG, &qua), "Failed to deallocate QUA memory.");
  ASSERT(destroy_map(SREG, &sof), "Failed to deallocate SOF memory.");
  ASSERT(destroy_map(SREG, &gal), "Failed to deallocate GAL memory.");
  ASSERT(destroy_map(SREG, &gar), "Failed to deallocate GAR memory.");
  ASSERT(destroy_map(SREG, &sla), "Failed to deallocate SLA memory.");
  dnit_channel(&A);
  dnit_channel(&B);
  ASSERT(dnit_prop(), "Failed to de-initialise properties file.");

  exit(sig == -1 ? EXIT_SUCCESS : EXIT_FAILURE);
}

void * record(void *arg) {
  Channel_Params *channel = (Channel_Params *) arg;

  #ifdef VERBOSE
  printf("---> Allocating Memory For Channel %s\n", channel->letter);
  #endif

  ASSERT(create_map( SREG, MAP_SHARED, &channel->sts, channel->sts_base ), "Failed to allocate map for STS register.");
  ASSERT(create_map( S4MB, MAP_SHARED, &channel->dma, channel->dma_base ), "Failed to allocate map for DMA RAM.");
  ASSERT(create_map( nbuffs*S2MB, MAP_SHARED | MAP_ANONYMOUS, &channel->buf, 0), "Failed to allocate space for buffer.");

  memset(channel->dma, 0x0, S4MB);

  int position, limit, offset;

  char * dir = "/tmp/redpitaya/recording.";
  char * path = malloc(strlen(dir) + strlen(channel->letter) + 1 + 4);
  strcpy(path, dir);
  strcat(path, channel->letter);
  strcat(path, ".bin");

  FILE *f = fopen(path, "w");
  limit = S2MB;

  #ifdef CONTINUOUS_TRANSMISSION
    sleep(100000);
  #endif

  for (int i = 0; i < nbuffs; ) {

    //Get the location of the DMA writer in terms of number of bytes written.
    position = get_reg(channel->sts) * 4;

    //Safe To Read Bottom                 //Safe To Read Top
    if((limit > 0 && position > limit) || (limit == 0 && position < S2MB)){

        offset = limit > 0 ? 0 : S2MB;
        limit = limit > 0 ? 0 : S2MB;
        memcpy(channel->buf + S2MB*i, channel->dma + offset, S2MB);

        if (i == nbuffs -1){
            clc_reg(cfg);
        }

        i++;

      } else {
        // Circle Back
      }

    }

    #ifdef VERBOSE
    printf("---> Writing Channel %s Results To File\n", channel->letter);
    #endif

    fwrite(channel->buf, 1, S2MB * nbuffs, f);
    fclose(f);
	free(path);

    #ifdef VERBOSE
    printf("---> Finished Channel %s \n", channel->letter);
    #endif

    return 0;
}


int main (int argc, char *argv[]){
  #ifdef VERBOSE
  printf("---> Configuring Transceiver\n");
  #endif

  ASSERT(init_prop(), "Failed to create properties file");

  bool is_real = true;
  nbuffs = NBUFFS;

  #ifdef REAL
  #ifdef VERBOSE
  printf("---> Operating Mode: Real\n");
  #endif
  is_real = true;
  #endif

  #ifdef I_Q
  #ifdef VERBOSE
  printf("---> Operating Mode: I_Q\n");
  #endif
  is_real = false;
  #endif

  write_prop("Comment", argv[1]);

  setpriority(PRIO_PROCESS, 0, -20);

  ASSERT(init_mem(), "Failed to open /dev/mem.");
  ASSERT(create_map( SREG, MAP_SHARED, &cfg, CFG_BASE_ADDR ), "Failed to allocate map for CFG register.");
  ASSERT(create_map( SREG, MAP_SHARED, &gen, GEN_BASE_ADDR ), "Failed to allocate map for GEN register.");
  ASSERT(create_map( SREG, MAP_SHARED, &pri, PRI_BASE_ADDR ), "Failed to allocate map for PRI register.");
  ASSERT(create_map( SREG, MAP_SHARED, &dag, DAG_BASE_ADDR ), "Failed to allocate map for DAG register.");
  ASSERT(create_map( SREG, MAP_SHARED, &qua, QUA_BASE_ADDR ), "Failed to allocate map for QUA register.");
  ASSERT(create_map( SREG, MAP_SHARED, &sof, SOF_BASE_ADDR ), "Failed to allocate map for SOF register.");
  ASSERT(create_map( SREG, MAP_SHARED, &gal, GAL_BASE_ADDR ), "Failed to allocate map for GAL register.");
  ASSERT(create_map( SREG, MAP_SHARED, &gar, GAR_BASE_ADDR ), "Failed to allocate map for GAR register.");
  ASSERT(create_map( SREG, MAP_SHARED, &sla, SLA_BASE_ADDR ), "Failed to allocate map for SLA register.");
  signal(SIGINT, exit_handler);

  clc_reg(cfg);
  clc_reg(gen);
  clc_reg(pri);
  clc_reg(dag);
  clc_reg(qua);
  clc_reg(sof);
  clc_reg(gal);
  clc_reg(gar);
  clc_reg(sla);

  double start_freq, end_freq, center_freq, bandwidth, phase_quad_offset, chirp_duration, pri_duration;
  uint64_t operating_flags, start_offset, slave_delay_n;
  uint16_t decimation, pri_drop_n_samples;
  uint8_t windowing, is_slave;

  if (argc >= 3){
    /* Setup CLI Parameters */
    center_freq         = atoi(argv[2]);
    bandwidth           = atoi(argv[3]);
    windowing           = atoi(argv[4]);
    is_real             = atoi(argv[5]);
    sscanf(argv[6], "%lf", &chirp_duration);
    sscanf(argv[7], "%lf", &pri_duration);
    nbuffs              = atoi(argv[8]);
    start_freq          = center_freq - bandwidth / 2.0;
    end_freq            = center_freq + bandwidth / 2.0;
    is_slave            = atoi(argv[9]);
    slave_delay_n       = atoi(argv[10]);
  } else {
    /*Set Setup.h Parameters */
    start_freq          = START_FREQ;
    end_freq            = END_FREQ;
    center_freq         = CENTER_FREQ;
    bandwidth           = BANDWIDTH;
    chirp_duration      = CHIRP_DURATION;
    pri_duration        = PRI_DURATION;
    slave_delay_n       = SLAVE_START_DELAY;

    #ifdef MAKE_SLAVE
        is_slave         = 1;
    #else
        is_slave         = 0;
    #endif

    #ifdef HAMMING
        windowing       = 1;
    #else
        windowing       = 0;
    #endif
  }

  operating_flags       = (is_real ? R_OPERATING_FLAGS : I_OPERATING_FLAGS) | ADDITIONAL_FLAGS;
  operating_flags       = is_slave ? operating_flags | IS_SLAVE_FLAG : operating_flags;
  decimation            = is_real ? R_DECIMATION : I_DECIMATION;
  phase_quad_offset     = is_real ? R_PHASE_QUAD_OFFSET : I_PHASE_QUAD_OFFSET;
  pri_drop_n_samples    = is_real ? R_PRI_DROP_N_SAMPLES : I_PRI_DROP_N_SAMPLES;
  start_offset          = is_real ? R_START_OFFSET : I_START_OFFSET;

  //Log basic parameters
  write_prop_l("Sample Rate (Hz)", ADC_RATE / decimation);
  write_prop_l("Decimation", decimation);
  write_prop("Operating Mode", is_real ? "Real" : "I_Q");
  write_prop_l("Buffer Size Per Channel (MB)", nbuffs * 2);
  write_prop("Is Device Slave", is_slave ? "true" : "false");

  //The order of initialisation is important here
  set_PRI(pri, pri_duration, decimation);
  ASSERT(set_DAC_array(cfg, pri, gal, gar, dag, sof, start_freq, end_freq, chirp_duration, DAC_RATE, TX_GAP_L, TX_GAP_R, decimation, start_offset, windowing), "Failed to initialise DAC array.");
  set_drop_amount(cfg, pri_drop_n_samples);
  set_decimation(cfg, decimation);
  set_frequency(gen, GEN_A_FREQ, GEN_B_FREQ);
  set_phasor(gen, GEN_A_PHASE, GEN_B_PHASE);
  set_quad_freq(qua, center_freq, phase_quad_offset);
  set_slave_delay(sla, slave_delay_n);

  init_channel(&A, 'A', DMA_A_BASE_ADDR, STS_A_BASE_ADDR);
  init_channel(&B, 'B', DMA_B_BASE_ADDR, STS_B_BASE_ADDR);

  pthread_create(&A->thread, NULL, record, (void *) A);
  pthread_create(&B->thread, NULL, record, (void *) B);

  set_led(cfg, 0b01111110);
  sleep(1);
  set_led(cfg, 0b10000001);

  enb_reg(cfg, operating_flags);
  enb_reg(cfg, SYSTEM_ENABLE);

  write_prop_h("CFG REG", get_reg(cfg));
  write_prop_h("GEN REG", get_reg(gen));

  pthread_join(A->thread, NULL);
  pthread_join(B->thread, NULL);

  write_prop_h("PRI REG", get_reg(pri));
  write_prop_h("QUA REG", get_reg(qua));
  write_prop_h("GAL REG", get_reg(gal));
  write_prop_h("GAR REG", get_reg(gar));

  #ifdef VERBOSE
  printf("---> Threads Joined. Finished Recording\n");
  #endif

  exit_handler(-1);
  return EXIT_SUCCESS;
}
