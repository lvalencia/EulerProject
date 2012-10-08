import Data.List
pandigitalSet = filter (\e-> head e /= 0) (permutations [0..9])
fromDigits = foldl addDigit 0                                                      
   where addDigit num d = 10*num + d 
decomposition xs = [ fromDigits $ [xs!!x,xs!!(x+1),xs!!(x+2)] | x<-[1..7] ]
property xs = all (\e -> e == True) [((head xs) !! n) `mod` ((last xs) !! n) == 0 | n<-[0..6]] 
solutionSet = map (fromDigits) (filter (not . null) [ if property ([decomposition xs]++[primesbase]) then xs else [] | xs<-pandigitalSet])
	where primesbase = [2,3,5,7,11,13,17]
main = print(foldl (+) 0 solutionSet)
