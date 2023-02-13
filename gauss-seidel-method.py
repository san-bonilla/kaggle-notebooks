import numpy as np
# Matriz inicial del sistema de ecuaciones a resolver
matriz_a = np.array([[15, -3, -1], [-3, 18, -6], [-4, -1, 12]])
matriz_a = np.array(matriz_a,dtype=float)

b = np.array([3800, 1200, 2350])
b = np.array(b,dtype=float)

# Procedimiento Gauss-seidel
arraySize = np.shape(matriz_a)
row_num = arraySize[0]
col_num = arraySize[1]
arr_zeros  = np.zeros(row_num,dtype=float)
tolerancia = 0.00001
iteramax = 100
#  aproximaciones iniciales
X = np.copy(arr_zeros)
diferencia = np.ones(row_num, dtype=float)
error = tolerancia * 2
itera = 0

while not(error<=tolerancia or itera>iteramax):
    for i in range(0,row_num,1):
        suma = 0 
        for j in range(0,col_num,1):
            # si el elemento actual no es de la diagonal principal...
            if (i!=j): 
                suma = suma-matriz_a[i,j]*X[j]
        
        nuevo = (b[i]+suma)/matriz_a[i,i]
        diferencia[i] = np.abs(nuevo-X[i])
        X[i] = nuevo
    error = np.max(diferencia)
    itera = itera + 1

# Respuesta X en columna
X = np.transpose([X])
# revisar si el método no converge
if (itera>iteramax):
    X=0
# SALIDA
print('matriz_a: ')
print(matriz_a)
print('b: ')
print(b)
print('aproximaciones de X: ')
print('x_1 = {}\nx_2 = {}\nx_3 = {}'.format(X[0][0], X[1][0], X[2][0]))
print('iteraciones: ', itera)