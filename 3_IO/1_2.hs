-- bind・return・do式

main :: IO()
main = do
  putStrLn "■2回の入力の結果を１回ずつ出力する"
  x <- getLine -- 返り値を束縛
  y <- getLine
  putStrLn $ "1つ目の入力 : " ++ x
  putStrLn $ "2つ目の入力 : " ++ y
  putChar '\n'

  putStrLn "■関数合成と組み合わせる"
  x <- getLine
  putStrLn $ "1つ目の入力 : " ++ x
-- getLine『を』returnする。文字列 + 入力の結果『を』putStrLnする。処理を合成
-- >>=は処理を『～を～』するという形で覚えるといいのかも。
  getLine >>= return . ("2つ目の入力 : " ++) >>= putStrLn