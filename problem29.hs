import Data.List
comb n = sort $ nub $ [ a^b | a<-[2..n], b<-[2..n] ]
main = print (length (comb 100))
