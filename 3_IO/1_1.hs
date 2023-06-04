-- IOアクションの組み立て

main :: IO()
main = do
  putStrLn "■ >>=演算子 getLineの返り値がそのままputStrLnに渡されて出力"
  let echo = getLine >>= putStrLn :: IO()
  echo

  putStrLn "■ >>=演算子を更に繋げて組み立てる。"
-- 1つ目のgetLineで "文字列1" :: String を 変数s に束縛
-- 2つ目のgetLineで "文字列2" :: String を 変数t に束縛
-- s t を引数にputStrLnを実行することで結果が出力される。
  let joinLines = getLine >>= \s -> getLine >>= \t -> putStrLn $ s ++ ":" ++ t
  joinLines

  putStrLn "■returnによる組み立て"
  let joinLines = getLine >>= \s -> getLine >>= \t -> return $ s ++ ":" ++ t
  joinLines >>= putStrLn

  putStrLn "■I/Oアクションの結果を捨てる。"
-- return ("Hoge", "Piyo") >>= (\(x, y) -> putStrLn x >>= (\_ -> putStrLn y))
-- アクションの結果を捨てるものは頻繁に書くので、>>演算子が準備されている。
  return ("Hoge", "Piyo") >>= \(x, y) -> putStrLn x >> putStrLn y

-- 以下関数等