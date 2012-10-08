import Data.List
import Data.Char
isPrime :: Int->Bool
isPrime x = null [y | y<-[2..floor (sqrt (fromIntegral x))], x `mod` y == 0]
pandigitalTo n = map (fromDigits) (permutations [1..n])
fromDigits = foldl addDigit 0                                                      
   where addDigit num d = 10*num + d 
pandigitalSet = filter (not . null) $ nub $ [ filter (isPrime) (pandigitalTo n) | n<-[3..9]]
main = print (maximum $ map (maximum) pandigitalSet)
