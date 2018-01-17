#include "binary.h"

float bit32ToFloat(uint32_t bit32)
{
	//https://en.wikipedia.org/wiki/Single-precision_floating-point_format	
	
	int sign = 1;
	float fraction = 1;	
	int exponent = -127;		
	
	float singleFloat = 0;		
	
	if (bit32 & (uint32_t)(1 << 31))
	{
		sign = -1;
	}
	
	for (int i = 1; i < 24; i++)
	{
		if (bit32 & (uint32_t)(1 << (23 - i)))
		{
			fraction += pow(2, -i);
		}
	}
	
	for (int i = 0; i < 8; i++)
	{
		if (bit32 & (uint32_t)(1 << (23 + i)))
		{
			exponent += pow(2, i);
		}
	}		
	
	singleFloat = sign*fraction*pow(2, exponent);
	
	return singleFloat;
}


uint32_t bit8ArrayToBit32(uint8_t *data)
{
	uint32_t bit32 = 0;
	
	bit32 = (uint32_t)(data[3] << 0);
	bit32 += (uint32_t)(data[2] << 8);
	bit32 += (uint32_t)(data[1] << 16);
	bit32 += (uint32_t)(data[0] << 24);
	
	return bit32;
}


float bit8ArrayToFloat(uint8_t *data)
{
	return bit32ToFloat(bit8ArrayToBit32(data));
}


uint8_t checkBit(uint32_t reg, uint8_t bit)
{
	if (reg & (uint32_t)(1 << bit))
		return 1;
	else
		return 0;
}



