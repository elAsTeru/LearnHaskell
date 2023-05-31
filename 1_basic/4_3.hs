-- ガード
-- パターンの後に|を書き、その後ろにBool型の式を置くことで、if文のように条件分岐が出来る。条件分岐が多岐にわたる場合、if文を使用使うより便利。


main :: IO()
main = do
 f 10
 putStrLn("\n")

 print $ f2 (10, True)
 print $ f2 (11, True)
 print $ f2 (10, False)
 putStrLn("\n")

 print $ f3 (10, True)
 print $ f3 (10, False)
 print $ f3 (11, True)


-- 以下関数


-- すべての値がFalseだった場合の為に、otherwiseとう値を使用可能。余りを求めるmodを使う。
f x = case x of n | n `mod` 2 == 0 -> putStrLn "even"
                  | otherwise      -> putStrLn "odd"

-- 各パターンにつき、複数のガード節をつけられる。otherwiseがなければ、そのパターンは諦めて次のパターンにチェックが進む。
f2 x = case x of (x1, True) | x1 `mod` 2 == 0 -> x1 `div` 2
                 (x1, _)    | x1 `mod` 2 == 0 -> x1
                            | otherwise       -> x1 - 1

-- ガードで判定したい内容がパターンマッチの場合には、<-を使うことでガード内にさらにパターンを書ける。
f3 x = case x of (x1, True) | (q, 0) <- x1 `divMod` 2 -> q
                 (x1, _)                              -> x1