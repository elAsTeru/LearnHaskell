-- if式
-- 条件分岐はif~then~elseを用いて表現

main :: IO()
main = do
 if(True)
  then
   putStrLn("TRUE")
  else
   putStrLn("FALSE")