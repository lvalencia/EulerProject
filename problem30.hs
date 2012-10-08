import Data.Char
isSumOfNthPow x n = sum (map (^n) (map digitToInt $ show x)) == x
set n = [ x | x<-[2..n], isSumOfNthPow x 5 ]
main = print (sum $ set $ 10^6)
