import Data.List
import Data.Char
intlist x n = [ x*y | y<-[1..n] ]
checkProperty xs = all (== (sort $ head ourList)) ourList 
   where ourList = map (sort . map digitToInt . show) xs
solutionSet = [ n | n<-[1..], checkProperty $ intlist n 6 ]
main = print ( head solutionSet )
