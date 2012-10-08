{- coprimesTo n = [ x | x<-[1..n-1], gcd n x == 1 ]
carmichael n = minimum $ [ m | m<-[1..n],  all (\x -> x^m `mod` n == 1) (coprimesTo n) ] -}
import Data.List
factors n = [ x | x<-[2..n `div` 2], n `mod` x == 0]
isPrime n = length (factors n) == 0
countPrimes a b n 
   |   isPrime(abs (n*(n+a)+b))   = countPrimes a b (n+1)
   |   otherwise                  = n

minus (x:xs) (y:ys) = case (compare x y) of                                        
           LT -> x : minus  xs  (y:ys)                                             
           EQ ->     minus  xs     ys                                              
           GT ->     minus (x:xs)  ys                                              
minus  xs     _     = xs 

primesTo m = 2 : sieve [3,5..m]  where                                             
    sieve []     = []                                                              
    sieve (p:xs) = p : sieve (xs `minus` [p*p, p*p+2*p..m])    

appendInverse xs
   | length xs > 0 && head xs > 0    = [head xs]++[(-1)*(head xs) ]++appendInverse (tail xs)
   | otherwise                       = []

pairs = [ [countPrimes a b 0, a, b] | a<-[-999..999], b<-(sort $ appendInverse$ primesTo 999), isPrime(abs (b))]
main = print (product $ tail $ last $ sort pairs)
