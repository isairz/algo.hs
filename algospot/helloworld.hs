import Control.Monad

hello str = putStrLn $ "Hello, " ++ str ++ "!"
getHello = do
  line <- getLine
  hello line

main = do
  n <- getLine
  replicateM (read n) getHello
