import Data.Char
import Data.List

nfibs n = let r = replicate (n-1) 0 ++ 1 : 1 : zipWith ((-).(2*)) (drop n r) r
          in r
list n = [x | x<-(tail (nfibs 2)), length (map digitToInt $ show x) == n]
main = print( elemIndex (head $ list 1000) (nfibs 2) )
