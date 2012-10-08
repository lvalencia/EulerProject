import Data.Char
ones = 1 : ones
integers   = head ones     : zipWith (+) integers   (tail ones)
factorials = head integers : zipWith (*) factorials (tail integers)
factorial n 
	| n > 0		= factorials !! (n-1)
   | otherwise	= 1
isCurious n = foldl (+) 0 (map factorial (map digitToInt $ show n)) == n
main = print(sum $ filter (isCurious) [3..factorial 9])
