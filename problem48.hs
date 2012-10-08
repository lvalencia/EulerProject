main = print(foldl (+) 0 [ x^x | x<-[1..1000] ] `mod` 10^10)
