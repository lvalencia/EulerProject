import Data.Char
result limit = result' 1 limit
	where
		toList n = map digitToInt $ show n
		oL = concat $ map (toList) [1..limit]
		result' n limit
			| n >= limit	= oL !! (n-1)
		 	| otherwise 	= (oL !! (n-1))*(result' (n*10) limit)
main = print(result 1000000)
