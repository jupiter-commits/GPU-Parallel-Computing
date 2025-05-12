import numpy as np
import cupy as cp
import time
import math
import matplotlib.pylab as plt

t_cpu_per_size = [0, 0, 0, 0, 0, 0, 0]
t_gpu_per_size = [0, 0, 0, 0, 0, 0, 0]
# matrix size equal 4 to the power of 3, 4, 5, 6, 7
matrix_sizes = [64, 256, 1024, 4096, 16384]
for i in matrix_sizes:
    matrix_size = i
    iterations = 16
    print(f"Matrix size: {i}")
    
    # create matrices
    host_a = np.random.rand(matrix_size, matrix_size)
    host_b = np.random.rand(matrix_size, matrix_size)
    host_c = np.random.rand(matrix_size, matrix_size)
    
    # matrices on the device (GPU)
    device_a = cp.asarray(host_a)
    device_b = cp.asarray(host_b)
    device_c = cp.asarray(host_c)
    
