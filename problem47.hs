import Data.List
primeFactors n = primeFactors' n 2
  where
    primeFactors' n f
      | f*f > n        = [n]
      | n `mod` f == 0 = f : primeFactors' (n `div` f) f
      | otherwise      = primeFactors' n (f + 1)
isPrime x = null [y | y<-[2..floor (sqrt (fromIntegral x))], x `mod` y == 0]
solSet n = filter (\e -> all (\x -> (length $ group $ primeFactors (e+x)) == n) [0..(fromIntegral n - 1)])  [1..]
main = print(head $ solSet 4)
