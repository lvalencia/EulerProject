fib n = round $ phi ** fromIntegral n / sq5
  where
    sq5 = sqrt 5 :: Double
    phi = (1 + sq5) / 2
upperBound x = if fib x < 4000000 then upperBound (x+1)
						else (x-1)
result = map fib [1..(upperBound 0)]
evens = [ x | x<-(result), x `mod` 2 == 0]
totals = foldl (+) 0 evens
main = print (totals)
