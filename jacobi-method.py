# %% [code]
import numpy as np
from sympy import difference_delta
#initial square matrix, linear, diagonally dominant
A = [
   [4,-1,-1,0],
   [-1,4,0,-1],
   [-1,0,4,-1],
   [1,-1,-1,4]
]
A = np.array(A,dtype=float)
# results of equations
b = [150,80,160,90]
b = np.array(b,dtype=float)

#initial guesses
Xi = [60,40,70,50]
Xi = np.array(Xi,dtype=float)
tolerance = 0.00001
iteraMax = 50

#procedure
arraySize = np.shape(A) # (4,4)
#4 columns and 4 rows
n = arraySize[0] # 4
m = arraySize[1] # 4
Xin = np.zeros(n,dtype=float) # array([0., 0., 0., 0.])
difference = np.zeros(n,dtype=float) # array([0., 0., 0., 0.])
error = tolerance*2
itera = 0

#while the error is greater than the tolerance and itera is less than iteraMax
while not(error <= tolerance or itera > iteraMax ):
    # range (0,4) by 1
    for i in range(0,n,1):
        # new is the current guess from [150,80,160,90]
        new = b[i] #150
        # range (0,4) by 1
        for j in range(0,m,1):
            # if the current element is not from the main diagonal
            if (i != j):
                # (3rd iteration) new is 150 - (0) * 90
                new = new - A[i,j]*Xi[j]
        # new is 150 / 4
        new = new / A[i,i]
        difference[i] = np.abs(new - Xi[i]) # abs(150/4 - 60)
        Xin[i] = new # 150/4
    error = np.max(difference)
    # update Xi
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