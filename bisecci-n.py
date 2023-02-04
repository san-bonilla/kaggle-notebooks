# %% [code]
# Función en la que se va a encontrar la raíz
def f(x):
    y = float()
    y = (0.95*(x**3)) - (5.9*(x**2)) + (10.9*x) - 6
    return float(y)

# Método de bisección
def biseccion(xinf, xsup, maxit, tol, exact):
    iteracion = int(1)
    f_raiz = float()
    intervalo = xsup - xinf
    # Hacer mientras se cumplan las condiciones: 
    # se llevan menos de maxit iteraciones y el intervalo es suficientemente grande (mayor a tol)
    while (iteracion < maxit) and (intervalo >= tol):
        # Evaluar el límite inferior y superior en la función
        f_xinf = f(xinf)
        f_xsup = f(xsup)
        # Calcular el punto medio
        punto_medio = float((xinf + xsup)/2)
        print(punto_medio)
        # Evaluar el punto medio en la función
        f_raiz = f(punto_medio)
        # Si el intervalo es muy chico... salir
        if intervalo < tol:
            break
        # Si la raíz se acerca a cero (menor a exact)... salir
        elif abs(f_raiz) < exact:
            break
        # Si hay un cambio de signo entre f(xinf) y f(punto_medio)
        elif f_xinf * f_raiz < 0:
            # Usar el punto medio como límite superior
            xsup = punto_medio
        # Si hay un cambio de signo entre f(xsup) y f(punto_medio)
        elif f_xsup * f_raiz < 0:
            # Usar el punto medio como límite inferior
            xinf = punto_medio
        # Actualizar el intervalo
        intervalo = xsup - xinf
        # Aumentar la iteracion
        iteracion += 1
    return punto_medio

xinf = float(3)
xsup = float(4)
maxit = int(100)
tol = float(0.0005)
exact = float(0.00005)
solucion = biseccion(xinf, xsup, maxit, tol, exact)
print('La solución es: ' + str(solucion))