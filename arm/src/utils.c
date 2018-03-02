#include "utils.h"

static int fd = 0;
static FILE *fd_prop = 0;

void ASSERT(int code, char * message){
	if (code == FAIL){
		printf("----------------------------------------\nError: %s\n----------------------------------------\n", message);
		exit(EXIT_FAILURE);
	}
}

int init_mem(void){
	if(fd || (fd = open("/dev/mem", O_RDWR | O_SYNC)) == -1) {
		return FAIL;
	}
   	return OK;
}

int dnit_mem(void){
	if (fd && close(fd) == 0){
		return OK;
	}
	return FAIL;
}

int create_map(size_t size, size_t map_flags, void** mapped, size_t offset){
	if (fd == -1){
		return FAIL;
	}

    *mapped = mmap(NULL, size, PROT_READ | PROT_WRITE, map_flags, offset == 0 ? -1 : fd, offset);

	if(mapped == (void *) -1) {
		return FAIL;
	}

	return OK;
}

int destroy_map(size_t size, void** mapped){
	if (fd == -1){
		return FAIL;
	}

    if((mapped == (void *) -1) || (mapped == NULL)) {
        return FAIL;
    }

    if((*mapped == (void *) -1) || (*mapped == NULL)) {
        return FAIL;
    }

    if(munmap(*mapped, size) < 0){
        return FAIL;
    }

    *mapped = NULL;
    return OK;
}

void init_channel(Channel **channel, char letter, uint32_t dma_base, uint32_t sts_base){
	(*channel) = malloc(sizeof(**channel));
	(*channel)->letter[0] = letter;
	(*channel)->dma_base = dma_base;
	(*channel)->sts_base = sts_base;
}

void dnit_channel(Channel **channel){
    #ifdef VERBOSE
	printf("---> Deallocating Channel %s\n", (*channel)->letter);
    #endif

	ASSERT(destroy_map(SREG, &(*channel)->sts), "Failed to deallocate STS memory.");
	ASSERT(destroy_map(S4MB, &(*channel)->dma), "Failed to deallocate DMA memory.");
	free(*channel);
}

void write_prop(char *tag, char *message){
    fprintf(fd_prop, "%-35s : %s\n", tag, message);
}

void write_prop_l(char *tag, long long message){
    fprintf(fd_prop, "%-35s : %lld\n", tag, message);
}

void write_prop_h(char *tag, long long message){
    fprintf(fd_prop, "%-35s : %llX\n", tag, message);
}

void write_prop_f(char *tag, float message){
    fprintf(fd_prop, "%-35s : %.3f\n", tag, message);
}

int init_prop(void){
    #ifdef VERBOSE
    printf("---> Initiating Properties File\n");
    #endif

    fd_prop = fopen("recording.txt", "w");
    if (fd_prop == NULL){
        return FAIL;
    }

	time_t timer;
    char buffer[26];
    struct tm* tm_info;

    time(&timer);
    tm_info = localtime(&timer);

    strftime(buffer, 26, "%Y-%m-%d %H:%M:%S", tm_info);

	write_prop("Initiate Time (UTC)", buffer);

    return OK;
}

int dnit_prop(void){
    #ifdef VERBOSE
    printf("---> Cleaning Properties File\n");
    #endif

    if (fclose(fd_prop) != 0){
        return FAIL;
    }
    return OK;
}


uint32_t get_phase_increment(double desired_frequency)
{
	return (uint32_t)round( (desired_frequency/DAC_RATE) * pow(2, DDS_PHASE_WIDTH) );
}


uint32_t get_phase_offset(double desired_offset)
{
	return (uint32_t)round( desired_offset/(2*M_PI) * pow(2, DDS_PHASE_WIDTH) );
}


