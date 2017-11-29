#include "colour.h"

void cprint(const char* text, int attr, int fg) 
{
	char command[13];	
	
	sprintf(command, "%c[%d;%dm", 0x1B, attr, fg + 30);
	printf("%s", command);
	
	printf("%s", text);
	
	sprintf(command, "%c[%d;%dm", 0x1B, RESET, WHITE + 30);
	printf("%s", command);	
}
