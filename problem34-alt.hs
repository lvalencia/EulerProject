import Data.Char
main = print(sum ([x | x <- [1..product[2..9]], x == sum (map (\n -> product [1..n]) (map (digitToInt) (show x)))]))
