-- 関数の定義は『関数名 引数 = 式』の形

-- インクリメント関数
incr x = x + 1

-- ラムダ式
-- 無名関数をincr2に代入
incr2 = \n -> n + 1 :: Int

main = do
 print (incr 0)
 print (incr2 1)