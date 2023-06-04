-- 標準入出力I/O

main :: IO()
main = interract $ map toUpper

interract :: (String -> String) -> IO()
interract f = do
  s <- getContents
  putStr (f s)