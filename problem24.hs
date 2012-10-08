import Data.List
main = print $  foldl ((+).(*10)) 0 $ ((sort . permutations) [0..9])!!(10^6-1)
