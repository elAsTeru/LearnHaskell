-- タプル
-- 型の違う2つ以上の値を組み合わせたいときには、タプル型を使う。

main :: IO()
main = do
 putStrLn "■2値のタプルはfstとsndで値を取り出せる。それぞれfirst,secondの略"
 print $ fst x
 print $ snd x

 putStrLn "■3値以上はパターンマッチを使用"
 let (x, _, _) = x2
 print (x)
 let (_, _, z) = x2
 print (z)


-- 以下関数

x = (True, [1, 2, 3]) :: (Bool, [Int])

x2 :: (Int, Int, Int)
x2 = (4, 5, 6)