# %% [code] {"jupyter":{"outputs_hidden":false},"execution":{"iopub.status.busy":"2023-02-03T21:22:14.744980Z","iopub.execute_input":"2023-02-03T21:22:14.745692Z","iopub.status.idle":"2023-02-03T21:22:14.756300Z","shell.execute_reply.started":"2023-02-03T21:22:14.745643Z","shell.execute_reply":"2023-02-03T21:22:14.755212Z"}}
#Inserte Función para la raiz deseada
def f(x):
    func= (x**3) + (4*x**2) - 10
    return func
def df(x):
    #Coloca la derivada
    return (3*(x**2)) + (8*x)
#Metodo Newton-Raphson
def NewtonRaphson(x0,tol,n): 
    #x0= valor inicial, tol=error,n=no iteraciones
    #Se coloca para la iteracion 
    for k in range(n):
        x1=x0-f(x0)/df(x0)
        #Para detener en la presicion deseada colocamos la formula
        if(abs(x1-x0)<tol):
            #Presentamos el valor obtenido 
            print('x',k+1,'=',x1,'es la raiz')
            return
        #Presentamos la actualizacion del valor
        x0=x1
        print('x',k+1,'=',x1)
NewtonRaphson(1,0.001,3)