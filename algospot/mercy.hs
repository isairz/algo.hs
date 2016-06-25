putNtimes n str = sequence_ [putStrLn str | i <- [1..n]]
mercy n = putNtimes n "Hello Algospot!"

main = do
  line <- getLine
  mercy $ read line
