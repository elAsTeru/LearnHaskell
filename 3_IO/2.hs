-- コマンドライン引数

import System.Environment

main :: IO()
main = do
  putStrLn "■コマンドライン引数の取得"
  args <- getArgs
  print args
  putChar '\n'

  putStrLn "■環境変数の取得1"
  lookupEnv "Path" >>= print
  putChar '\n'

  putStrLn "■環境変数の取得2"
  lookupEnv "NOT_EXIST_ENV" >>= print
  putChar '\n'

  putStrLn "■環境変数の設定"
-- 新規
  setEnv "NEW_ENV" "New Envs Value"
  getEnv "NEW_ENV" >>= print
-- 更新
  setEnv "NEW_ENV" "My Envs Value"
  getEnv "NEW_ENV" >>= print
-- 削除
  unsetEnv "NEW_ENV"
  lookupEnv "NEW_ENV" >>= print
  putChar '\n'