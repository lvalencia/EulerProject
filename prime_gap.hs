import Data.List

{- Deals With Input and Ouput-}
getInt :: String -> Int
getInt str = read (takeWhile (/= ' ') str)::Int

convertToHumanReadable :: [(Int, [(Int, Int)])] -> [[Char]]
convertToHumanReadable solution = map (\e -> (header (fst e))++section++(solutionData $ snd e)) solution

header :: Int -> String
header prime = "Primes found between 2 and "++(show $ prime)++": "++(show $ numPrimesTo prime)++"\n"

section :: String
section = "\nInterprime Gap   Frequency\n"

solutionData :: [(Int, Int)] -> String
solutionData xs = unlines $ map (\tuple -> "\t"++(show $ fst tuple)++"\t\t"++(show $ snd tuple)) xs

{- Actual Problem Solution -}
{- Solve Prime Generation using Sieves -}
minus (x:xs) (y:ys) = case (compare x y) of                                        
           LT -> x : minus  xs  (y:ys)                                             
           EQ ->     minus  xs     ys                                              
           GT ->     minus (x:xs)  ys                                              
minus  xs     _     = xs                                                           
primesTo m = 2 : sieve [3,5..m]  where                                             
    sieve []     = []                                                              
    sieve (p:xs) = p : sieve (xs `minus` [p*p, p*p+2*p..m]) 

numPrimesTo m = length $ primesTo m

{- Solve Problem -}
interPrimeGap :: [Int] -> [Int]
interPrimeGap xs = zipWith(-)(tail xs)xs

gapAndFrequency :: [Int] -> [(Int, Int)]
gapAndFrequency xs = map (\e -> (head e, length e)) $ (group . sort) xs

{- Array of Solutions for Input Set -}
solve :: [Int] -> [(Int, [(Int, Int)])]
solve xs = map (\e -> (e, (gapAndFrequency $ interPrimeGap $ primesTo e))) xs

{- Actual Execution -}
main :: IO ()
main = do 
		s <- getContents
		let r = map getInt (lines s)
		let b = (solve r)
		putStr $ unlines $ convertToHumanReadable b
