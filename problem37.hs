import Data.Char
truncationL xs 
	| length xs > 0	= xs:(truncationL $ tail xs)
	| otherwise			= []
truncationR xs
	| length xs > 0 	= xs:(truncationR $ take ((length xs)-1) xs)
	| otherwise 		= []
fromDigits = foldl addDigit 0                                                      
   where addDigit num d = 10*num + d 
isPrime :: Int->Bool
isPrime x = if x == 1 then False else null [y | y<-[2..floor (sqrt (fromIntegral x))], x `mod` y == 0]
isTruncatablePrime n = all (\e -> isPrime $ fromDigits e) (truncationL $ map digitToInt $ show n) 
						  && all (\e -> isPrime $ fromDigits e) (truncationR $ map digitToInt $ show n)
truncatablePrimes :: [Int]
truncatablePrimes = [ x | x<-[11..(10^6)], isTruncatablePrime x]
main = print(foldl (+) 0 truncatablePrimes)
