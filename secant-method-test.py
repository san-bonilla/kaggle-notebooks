#Metodo secante
def secante(func,x0,x1,n):
    # Leer la función
    def f(x):
        f=eval(func)
        return f
    
    # Realizar n veces
    for intercept in range(1,n):
        # Evaluar x0 y x1 en la función
        fx0=f(x0)
        fx1=f(x1)
        # Calcular xi
        if (x0 - x1) != 0:
            xi = x0 - (fx0 / ((fx0 - fx1) / (x0-x1)))
        else:
            return xi
        x0=x1
        x1=xi
        print(f"Se encontro la raiz en {xi} despues de {n} iteraciones")
secante("(0.95*x**3)-(5.9*x**2)+(10.9*x)-6",2.5,3.5,100)