-- 遅延評価と非正格性
-- 多くの言語は先行評価(正格評価)→関数呼出しの前に引数の計算を行う。
-- Haskellは遅延評価(非正格評価)→値が必要になったタイミングで計算を行う。
-- 利点→エラーが発生したり評価に時間のかかる式を先送りできる。
-- ※未評価部分の事をサンクと呼ぶ。

func :: Int -> Int
func x = 1

-- 標準関数seqを使うことで、引数を2つ受け取り、第二引数をそのまま返すが、先に第一引数が評価される。
func2 :: Int -> Int
func2 x = seq x 1

main :: IO()
main = do
-- 多くの言語では 0÷0 が計算されるのでエラーになる。
 print $ func $ 0 `div` 0
-- 先行評価を強制することも可能。(エラーで実行が停止されるのでコメントアウトすると見たい方が見れる。)
 print $ func $! 0 `div` 0
 print $ func2 $ 0 `div` 0