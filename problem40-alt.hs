import Data.Char
main = print(foldr(*)1$map(\x->digitToInt$concat[show x|x<-[0..]]!!(10^x))[0..6])
