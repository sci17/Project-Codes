fib = lambda n:n if n<=1 else fib (n-1)+ fib(n-2)
n=int(input("Enter range:"))
for x in range(0,n+1):
    print(fib(x))