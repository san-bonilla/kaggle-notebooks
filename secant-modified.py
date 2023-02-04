#Metodo secante modificada
def secmodi(func,x1,d,n):
    def f(x):
        f=eval(func)
        return f
    for intercept in range (1,n):
        fx1=f(x1)
        fxd=f(x1+(d*x1))
        xi=x1-(((d*x1)*fx1)/(fxd-fx1))
        x1=xi
        print(f"Se encontro la raiz en {xi} despues de {n} iteraciones")
secmodi("(0.95*x**3)-(5.9*x**2)+(10.9*x)-6",3.5,0.01,3)
