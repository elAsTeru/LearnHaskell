-- パターンマッチ
-- 値の形式によって処理を分岐する機能。case~of~式を使う。

main :: IO()
main = do
 putStrLn("■真偽パターン")
 case True of
  True -> print(True)
  False -> print(False)

 putStrLn("■変数パターン")
 let x = 3
 case x of
  1 -> putStrLn "1st"
  2 -> putStrLn "2nd"
  3 -> putStrLn "3rd"
  _ -> putStrLn "1~3以外"

 putStrLn("■ワイルドカードパターン")
-- 束縛した値を使わずマッチさせることが目的の場合、ワイルドカード(_)を使用することで、新たな変数を導入せずに任意の値をマッチさせることが出来る。
 print(myDiv (100, 10))
 print(myDiv (100, 0))
 print(myDiv (0, 0))

 putStrLn("■アズパターン＠")
-- タプルのTrueやFalseを見て処理を切り分けたい場合に使用する。
 print(divOrMyDiv((5, 2), False))
 print(divOrMyDiv((0, 0), True))
-- divide by zero
-- print(divOrMyDiv((0, 0), False))

 putStrLn("■反駁不可能パターン")
-- パターンの先頭に~をつけることで、パターン内の変数を実際に使用するまで、評価を遅らせ、式がボトムに評価されるとしてもそのまま評価を継続できるように出来る。
 print(case undefined of ~(_, _) -> True)
 print(h(1, 0))
-- print(h(1, 1))

 putStrLn("■コンストラクタパターン")
-- データ型から個々の値を取り出すフィールドへのアクセサ
 let x = (1, "one")
 case x of (x1, x2) -> print x2 
 let y = (1, 10)
 case y of (y1, y2) -> print $ y1 + y2


-- 以下関数
-- ワイルドカード_
myDiv x = case x of (0, 0) -> 1 :: Int
                    (_, 0) -> maxBound
                    (x, y) -> x `div` y

-- アズパターン＠
divOrMyDiv x = case x of (x'@(_, 0), True) -> myDiv x'
                         (   (x, y), _   ) -> x `div` y

-- 反駁パターン
h x = case x of ~(x, 0) -> x
                (_, y) -> y