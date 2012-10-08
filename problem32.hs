import Data.Char
import Data.List
toList n = (map digitToInt $ show n)
fromDigits = foldl addDigit 0
   where addDigit num d = 10*num + d
pandigitalSet = map (fromDigits) (permutations [1..9])
lastN n xs = tailN' ((length xs)-n) xs
	where tailN' n xs = if n > 0 then tailN' (n-1) (tail xs) else xs
satisfiesQuality n = elem True $ [ (fromDigits $ take i $ list) * (fromDigits $ take j $ lastN (9-i) list) == (fromDigits $ lastN (9-(i+j)) list) | i<-[1..7], j<-[1..(9-i)]]
	where list = toList n
result = sum $ nub $ (map fromDigits . map (\x -> lastN 4 (toList x))) ([x | x<-pandigitalSet, satisfiesQuality x]) 
main = print (result)
