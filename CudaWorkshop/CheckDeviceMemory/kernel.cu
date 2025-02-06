
#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>

// 디바이스 메모리 체크
void checkDeviceMemory(void)
{
	size_t free, total;
	cudaMemGetInfo(&free, &total);
	printf("Device memory (free/total) = %lld/%lld bytes\n", free, total);
}

int main(void)
{
	int* dDataPointer;
	cudaError_t errorCode;

	// 디바이스 메모리 할당
	checkDeviceMemory();
	errorCode = cudaMalloc(&dDataPointer, sizeof(int) * 1024 * 1024);
	printf("cudaMalloc - %s\n", cudaGetErrorName(errorCode));

	// 디바이스 메모리 초기화
	checkDeviceMemory();
	errorCode = cudaMemset(&dDataPointer, 0, sizeof(int) * 1024 * 1024);
	printf("cudaMemset - %s\n", cudaGetErrorName(errorCode));

	// 디바이스 메모리 해제
	errorCode = cudaFree(dDataPointer);
	printf("cudaFree - %s\n", cudaGetErrorName(errorCode));
	checkDeviceMemory();
}