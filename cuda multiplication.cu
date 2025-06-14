#include <stdio.h>

const int MATRIX_SIZE = 256;
const int BLOCK_SIZE = 16;
dim3 blockSize(BLOCK_SIZE, BLOCK_SIZE);
float gridNumber = (MATRIX_SIZE + BLOCK_SIZE - 1) / BLOCK_SIZE;
dim3 grid(gridNumber, gridNumber);

__global__ matrixMultiply(const float *matA, const float *matB, const float *r, int matrixSize){
    int indexColumn = threadIdx.x + blockDimx.x * blockIdx.x;
    int indexRow = threadIdx.y + blockDimx.y + blockIdx.y;

}

__global__ expressionCalculator(const float *A, const float *B, const float *C, const float *result, int matrixSize){
	matrixMultiply<<<grid, blockSize>>>();
	matrixMultiply<<<grid, blockSize>>>();
	
}

int main(){
    float *hostA, *hostB, *hostC, *hostResult, *deviceA, *deviceB, *deviceC, *deviceResult;

    // Allocate memory in host memory space
    int elements = MATRIX_SIZE * MATRIX_SIZE;
    hostA = new float[elements];
    hostB = new float[elements];
    hostC = new float[elements];
    hostResult = new float[elements];
    
    for (int i=0; i<elements; i++){
        hostA[i] = rand();
        hostB[i] = rand();
        hostC[i] = rand();
    }
    
    // Allocate in device memory space
    cudaMalloc(&deviceA, elements*sizeof(float));
    cudaMalloc(&deviceB, elements*sizeof(float));
    cudaMalloc(&deviceC, elements*sizeof(float));
    cudaMalloc(&deviceResult, elements*sizeof(float));

    cudaMemcpy(deviceA, hostA, elements*sizeof(float), cudaMemcpyHostToDevice);
    cudaMemcpy(deviceB, hostB, elements*sizeof(float), cudaMemcpyHostToDevice);
    cudaMemcpy(deviceC, hostC, elements*sizeof(float), cudaMemcpyHostToDevice);
    
    printf("Finished execution\n");

    return 0;
}
