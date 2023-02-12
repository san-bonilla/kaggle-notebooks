# %% [code]
import numpy as np
from sympy import difference_delta
#data
A = [
   [4,-1,-1,0],
   [-1,4,0,-1],
   [-1,0,4,-1],
   [1,-1,-1,4]
]
A = np.array(A,dtype=float)
b = [150,80,160,90]
b = np.array(b,dtype=float)
Xi = [60,40,70,50]
Xi = np.array(Xi,dtype=float)
tolerance = 0.00001
iteraMax = 50

#procedure
arraySize = np.shape(A)
n = arraySize[0]
m = arraySize[1]
Xin = np.zeros(n,dtype=float)
difference = np.zeros(n,dtype=float)
error = tolerance*2
itera = 0
while not(error <= tolerance or itera > iteraMax ):
   for i in range(0,n,1):
      new = b[i]
      for j in range(0,m,1):
         if (i != j):
            new = new - A[i,j]*Xi[j]
      new = new / A[i,i]
      difference[i] = np.abs(new - Xi[i])
      Xin[i] = new
   error = np.max(difference)
   Xi = np.copy(Xin)
   itera += 1
if itera >= iteraMax:
   Xin = np.nan

#output
print(A)
print(b)
print(Xin)
print(error)
print(itera)