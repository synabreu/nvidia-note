
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

__global__ void helloCUDA(void)
{
	printf("Hello, CUDA!\n");
}

int main(void)
{
	helloCUDA<<<1, 5>>>();
	return 0;
}