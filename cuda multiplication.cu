#include <stdio.h>

__global__ expressionCalculator(const float *A, const float *B, const float *C, const float *result, int matrixSize){
}

int main(){
    float *hostA, *hostB, *hostC, *hostResult, *deviceA, *deviceB, *deviceC, *deviceResult;

    // Allocate memory in host memory space
    int elements = MATRIX_SIZE * MATRIX_SIZE;
    hostA = new float[elements];
    hostB = new float[elements];
    hostC = new float[elements];
    hostResult = new float[elements];

    return 0;
}