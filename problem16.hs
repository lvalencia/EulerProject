import Data.List
convRadix :: (Integral b) => b -> b -> [b]
convRadix n = unfoldr (\b -> if b == 0 then Nothing else Just (b `mod` n, b `div` n))
numToList n = reverse(convRadix 10 n)
sumOfDigits n = foldl (+) 0 (numToList n)
main = print(sumOfDigits(2^1000))
