import Data.Char
fracList :: [[[Int]]]
fracList = [ [map digitToInt $ show x, map digitToInt $ show y] | x<-[10..99], y<-[10..99], x < y ]
filteredList :: [[[Int]]]
filteredList = filter (\e -> (head $ head e) == (last $ last e) || (head $ last e) == (last $ head e)) fracList
fromDigits :: [Int] -> Int
fromDigits = foldl addDigit 0                                                      
   where addDigit num d = 10*num + d 
fracPair :: [[Int]] -> Bool
fracPair p
	| toRational (fromDigits $ last p) /= 0 && toRational (last $ last p) /= 0 	= toRational (fromDigits $ head p) / toRational (fromDigits $ last p) == toRational (head $ head p) / toRational (last $ last p) 
	| toRational (fromDigits $ last p) /= 0 && toRational (last $ head p) /= 0 	= toRational (fromDigits $ head p) / toRational (fromDigits $ last p) == toRational (head $ last p) / toRational (last $ head p)	
   | otherwise 																						= False
fourSuchFractions :: [[Int]]
fourSuchFractions =  map (\e -> [fromDigits $ head e, fromDigits $ last e]) $ filter (\e -> fracPair e) filteredList
prodFrac :: [Int]
prodFrac = [foldl (*) 1 $ map (\e-> head e) fourSuchFractions, foldl (*) 1 $ map (\e -> last e) fourSuchFractions]
main :: IO ()
main = print(last $ map (\e -> e `div` divisor) prodFrac)
	where divisor = gcd (head prodFrac) (last prodFrac)
