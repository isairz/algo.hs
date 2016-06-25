import Control.Monad
import Data.Char

unEscapeString :: String -> String
unEscapeString [] = ""
unEscapeString s@(c:cs) = case unEscapeByte s of
  Just (byte, rest) -> (chr byte) : unEscapeString rest
  Nothing -> c : unEscapeString cs

unEscapeByte :: String -> Maybe (Int, String)
unEscapeByte ('%':x1:x2:s) | isHexDigit x1 && isHexDigit x2 =
  Just (digitToInt x1 * 16 + digitToInt x2, s)
unEscapeByte _ = Nothing

uri = do
  line <- getLine
  putStrLn $ unEscapeString line

main = do
  n <- getLine
  replicateM (read n) uri

