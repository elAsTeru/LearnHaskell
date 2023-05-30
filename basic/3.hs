-- main関数とdo式

-- do式を使うことで複数の命令を実行することが出来る。

import System.Environment

main :: IO()
main = do
 let title = "Current User:"
-- 値を返すIOアクションの実行結果を変数に束縛するには、変数名 <- IOアクションという記法を使う。また、do式の中ではletを単体で使った変数の束縛もできる。
 user <- getEnv "USERNAME"
 putStrLn title
 putStrLn user