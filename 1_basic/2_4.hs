-- $によるかっこ省略

add x y = x + y :: Int

main = do
 print(add 1(add (add 2 3) 4))
-- $を使用することで()を省略できる。可読性を高めるために使用される。
 print(add 1 $ add (add 2 3) 4)

-- $が連続する場合
 print(add 1 $ add 2 $ add 3 $ 4)
-- 関数合成を使ったか書き方も可能
 print(add 1 . add 2 . add 3 $ 4)