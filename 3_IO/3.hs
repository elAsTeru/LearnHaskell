import System.Directory

main :: IO()
main = do
  putStrLn "■ファイルの生成と書き込み"
  writeFile "test.txt" "Hello"  -- ファイルパスと書き込む文字
  readFile "test.txt" >>= putStrLn
  putStrLn "■ファイルに文字列を追加"
  appendFile "test.txt" ", World"
  readFile "test.txt" >>= putStrLn
  putStrLn "■ファイルの削除(System.Directoryモジュールが必要)"
  removeFile "test.txt"
  readFile "test.txt" >>= putStrLn
  putChar '\n'