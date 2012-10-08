hNum :: Integer -> Integer
hNum n = n*(2*n-1)
isInt x = x == fromInteger (round x)
isPNum n = isInt $ (sqrt(fromIntegral(24*n+1))+1)/6
solSet = filter (isPNum) [ hNum (x) | x<-[144..] ]
main = print (head $ solSet)
