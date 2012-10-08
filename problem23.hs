import Data.List

factors n = [ x | x<-[1..n `div` 2], n `mod` x == 0]
isAbundant n = if (foldl (+) 0 (factors n)) > n then True else False
abundantNums limit = [ x | x<-[1..limit], isAbundant x ]
aNums = abundantNums 28123
sumOfAbundantNums = [ x+y | x<-aNums, y<-aNums ]
nums = [ x | x<-[1..28123]]

main = print(nums \\ sumOfAbundantNums)
