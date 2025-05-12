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
    
    # run on CPU
    t_cpu_start = time.time()
    for _ in range(iterations):
        host_result = host_a @ host_b @ host_c + host_a
    t_cpu = time.time() - t_cpu_start
    print(f"  CPU time is {t_cpu:.4f}")
    
    # run on GPU
    t_gpu_start = time.time()
    for _ in range(iterations):
        device_result = device_a @ device_b @ device_c + device_a
    cp.cuda.Stream.null.synchronize()
    t_gpu = time.time() - t_gpu_start
    print(f"  GPU time is {t_gpu:.4f}\n")
