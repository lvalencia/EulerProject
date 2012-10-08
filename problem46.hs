minus (x:xs) (y:ys) = case (compare x y) of                                        
           LT -> x : minus  xs  (y:ys)                                             
           EQ ->     minus  xs     ys                                              
           GT ->     minus (x:xs)  ys                                              
minus  xs     _     = xs                                                           
primesTo m = 2 : sieve [3,5..m]  where                                             
    sieve []     = []                                                              
    sieve (p:xs) = p : sieve (xs `minus` [p*p, p*p+2*p..m])
oddNumbers = [ 2*x+1 | x<-[1..]]
isInt x = x == fromInteger (round x)
solSet = filter (not .(\e -> elem True $ map (\x -> isInt $ sqrt(fromIntegral ((e-x) `div` 2))) (primesTo e))) oddNumbers
main = print(head $ solSet)
