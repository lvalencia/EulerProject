tNum n = n*(n+1) `div` 2
isInt x = x == fromInteger (round x)
isPNum n = isInt $ (sqrt(fromIntegral(24*n+1))+1)/6
isHNum n = isInt $ (sqrt(fromIntegral(8*n+1))+1)/4
solSet = filter (\e -> isPNum e && isHNum e) [ tNum (x) | x<-[286..] ]
main = print (head $ solSet)
