import Data.Char
minus (x:xs) (y:ys) = case (compare x y) of                                        
           LT -> x : minus  xs  (y:ys)                                             
           EQ ->     minus  xs     ys                                              
           GT ->     minus (x:xs)  ys                                              
minus  xs     _     = xs                                                           
primesTo m = 2 : sieve [3,5..m]  where                                             
    sieve []     = []                                                              
    sieve (p:xs) = p : sieve (xs `minus` [p*p, p*p+2*p..m])  
fromDigits = foldl addDigit 0                                                      
   where addDigit num d = 10*num + d 
isPrime :: Int->Bool
isPrime x = null [y | y<-[2..floor (sqrt (fromIntegral x))], x `mod` y == 0]
rotations n = rotate n (length n)
	where rotate n l = if (l-1) > 0 then [(tail n)++[(head n)]] ++ rotate ((tail n)++[(head n)]) (l-1) else [(tail n)++[(head n)]] 
isCircular n = all (isPrime) (map fromDigits $ rotations $ map digitToInt $ show n)
main = print(length $ filter (isCircular) $ primesTo $ 10^6)
