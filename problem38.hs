import Data.List
import Data.Char
fromDigits = foldl addDigit 0                                                      
   where addDigit num d = 10*num + d 
problemSpace = filter (>= 918273645) $ map fromDigits $ reverse $ sort $ permutations [1..9] 
numDigits :: Int -> Int
numDigits q = floor (logBase 10 (fromIntegral q)) + 1
listForm n = map digitToInt $ show n
workList xs = map (*(fromDigits xs)) [1..9]
lengthList xs = map (numDigits) xs
fromMulDigits = foldl addDigit 0
   where addDigit num d = (10 ^ (floor $ (log (fromIntegral d)) / (log 10) + 1))*num + d 
check ll wl c n
	| length ll == 1	= fromMulDigits (take (c+1) wl) == n
	| (head ll)+(head $ tail ll) < 9	= check ([(head ll)+(head $ tail ll)]++(tail $ tail ll)) wl (c+1) n
 	| (head ll)+(head $ tail ll) > 9	= False
	| (head ll)+(head $ tail ll) == 9	= fromMulDigits (take (c+1) wl) == n
truncateR xs
	| length xs > 0 	= xs:(truncateR $ take ((length xs)-1) xs)
	| otherwise 		= []
trunc xs = reverse $ truncateR xs
isDecomposable n = elem True $ map (\e -> check (lengthList $ workList e) (workList e) 1 n) (trunc $ listForm n)
main = print(head $ take 1 $ filter (isDecomposable) problemSpace)
