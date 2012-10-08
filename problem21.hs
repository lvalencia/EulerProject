{-import Data.List
primeFactors :: Integer -> [Integer]                                               
primeFactors a = let (f, f1) = factorPairOf a
                     f' = if prime f then [f] else primeFactors f
                     f1' = if prime f1 then [f1] else primeFactors f1
                 in f' ++ f1'
 where
 list = factors a
 factorPairOf a = let f = if length list == 0 then 1 else head $ list
                  in (f, a `div` f)
 factors a    = filter (isFactor a) [2..a-1]
 isFactor a b = a `mod` b == 0
 prime a      = null $ factors a

tuplify :: [Integer] -> (Integer, Integer)
tuplify [x] = (x, 1)
tuplify [x,y] = (x,y)

cartesianWith f xs = concatMap $ \y -> map (`f` y) xs

factors =
    foldl (cartesianWith (*)) [1] . map (\(p, e) -> map (p^) [0..e])

propFactors n = if length pf > 1 then init $ nub $ pf else nub $ pf
	where pf = factors(map (\x -> (head x, genericLength(x))) $ group $ sort $ primeFactors n) 
-}
propFactors n = [ x | x<-[1..n `div` 2], n `mod` x == 0]  
d n = foldl (+) 0 (propFactors n)

aNum n = if (n /= b) then if (n == a) then if n<b then [n, b] else [b, n] else aNum (n+1) else aNum(n+1)
	where 
	b = (d n) 
	a = (d b)

amicable base limit = if (head $ tail result) < limit then result++(amicable ((head $ tail result)+1) limit) else []
	where result = aNum base

main = print(foldl (+) 0 (amicable 220 10000))
{-
minus (x:xs) (y:ys) = case (compare x y) of 
           LT -> x : minus  xs  (y:ys)
           EQ ->     minus  xs     ys 
           GT ->     minus (x:xs)  ys
minus  xs     _     = xs

primesTo m = 2 : sieve [3,5..m]  where
    sieve []     = []
    sieve (p:xs) = p : sieve (xs `minus` [p*p, p*p+2*p..m])

p n m = (2^(n-m)+1)*2^m-1
q n m = (2^(n-m)+1)*2^m-1
r n m = (2^(n-m)+1)*2^(m+n)-1 -}
