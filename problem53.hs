f n = foldl (*) 1 [2..n]
c n r = (f n) `div` ((f r)*(f $ n - r))
solution = filter (> 10^6) $ [ c n r | n<-[1..100], r<-[1..n] ]
main = print ( length solution )
