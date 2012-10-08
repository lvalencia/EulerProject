part :: String -> Integer
part str = (i)
   where i = read (takeWhile(/=' ') str)::Integer
main :: IO ()
main = do s <- getContents
          let x = map part (lines s)
	  print (foldl (+) 0 x)
