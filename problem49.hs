import Data.List
import Data.Char
isPermutation x y = sort (map digitToInt $ show x) == sort (map digitToInt $ show y)
minus (x:xs) (y:ys) = case (compare x y) of 
           LT -> x : minus  xs  (y:ys)
           EQ ->     minus  xs     ys 
           GT ->     minus (x:xs)  ys
minus  xs     _     = xs
primesTo m = 2 : sieve [3,5..m]  where
    sieve []     = []
    sieve (p:xs) = p : sieve (xs `minus` [p*p, p*p+2*p..m])
primesFromTo x n = filter (>= x) (primesTo n)
isPrime :: Int->Bool
isPrime x = null [y | y<-[2..floor (sqrt (fromIntegral x))], x `mod` y == 0]
solSet = filter (\e -> all (\x -> if isPrime (e+x) then isPermutation (e+x) e else False) [0,3330, 6660]) (primesFromTo 1000 9999)
fromMulDigits = foldl addDigit 0                                                   
   where addDigit num d = (10 ^ (floor $ (log (fromIntegral d)) / (log 10) + 1))*num + d 
main = print(fromMulDigits (map (toInteger . (+ (last solSet))) [0,3330, 6660]))
