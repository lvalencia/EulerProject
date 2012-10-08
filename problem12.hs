import Data.List

primeFactors :: Integer -> [Integer]
primeFactors a = let (f, f1) = factorPairOf a
                     f' = if prime f then [f] else primeFactors f
                     f1' = if prime f1 then [f1] else primeFactors f1
                 in f' ++ f1'
 where
 factorPairOf a = let f = head $ factors a
                  in (f, a `div` f)
 factors a    = filter (isFactor a) [2..a-1]
 isFactor a b = a `mod` b == 0
 prime a      = null $ factors a

numDiv n = (product $ map ((+1) . length) $ group $ primeFactors ((n*(n+1)) `div` 2))
result cutoff = result' 3 cutoff
	where
 		result' n cutoff = if (numDiv n) >= cutoff then(n*(n+1)) `div` 2 else result' (n+1) cutoff

main = print(result 500)
