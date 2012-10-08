factorial n 
	| n == 1		= 1
	| otherwise	= n*factorial(n-1)
choose n k = div (factorial n) (factorial(k)*factorial(n-k))
main = print (choose 21+21-2 21-1)
