# %% [code]
# Función en la que se va a encontrar la raíz
def f(x):
    y = float()
    y = (0.95*(x**3)) - (5.9*(x**2)) + (10.9*x) - 6
    return float(y)

# Método de Falsa posición
def false_position(xinf, xsup, maxit, tol, exact):
    iteracion = int(1)
    f_raiz = float()
    intervalo = xsup - xinf
    # Hacer mientras se cumplan las condiciones: 
    # se llevan menos de maxit iteraciones y el intervalo es suficientemente grande (mayor a tol)
    while (iteracion < maxit) and (intervalo >= tol):
        # Evaluar el límite inferior y superior en la función
        f_xinf = f(xinf)
        f_xsup = f(xsup)
        # Calcular el valor de c
        c = float(((xinf * f_xsup) - (xsup * f_xinf)) / (f_xsup - f_xinf))
        # ecuación iterativa equivalente: c = xsup - (f_xsup * (xinf-xsup)) / (f_xinf - f_xsup)
        # Evaluar c en la función
        f_raiz = f(c)
        # Si el intervalo es muy chico... salir
        if intervalo < tol:
            break
        # Si la raíz se acerca a cero (menor a exact)... salir
        elif abs(f_raiz) < exact:
            break
        # Si hay un cambio de signo entre f(xinf) y f(c)
        elif f_xinf * f_raiz < 0:
            # Usar c como límite superior
            xsup = c
        # Si hay un cambio de signo entre f(xsup) y f(c)
        elif f_xsup * f_raiz < 0:
            # Usar c como límite inferior
            xinf = c
        # Actualizar el intervalo
        intervalo = xsup - xinf
        # Aumentar la iteracion
        iteracion += 1
    return c

xinf = float(3)
xsup = float(4)
maxit = int(100)
tol = float(0.0005)
exact = float(0.00005)
solucion = false_position(xinf, xsup, maxit, tol, exact)
print('La solución es: ' + str(solucion))