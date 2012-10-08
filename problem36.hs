import Data.Char
import Data.List
decimalToBin n 
	| n == 0			= []
	| n `mod` 2 == 1 		= decimalToBin (n `div` 2)++[1]
	| n `mod` 2 == 0		= decimalToBin (n `div` 2)++[0]
isPalindrome xs = xs == reverse xs
ourSet = nub $ [ x | x<-[1..(10^6)], isPalindrome $ map digitToInt $ show (x), isPalindrome $ decimalToBin (x)]
main = print (foldl (+) 0 ourSet)
