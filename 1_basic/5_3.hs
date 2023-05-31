-- Maybe a型
-- nullがなく関数は決まった型を返す必要がある。だが処理で問題が発生し値を返せない可能性がある場合に、nullのようなものを返したい場合に使う。

import Data.Maybe

main :: IO()
main = do
 putStrLn "■Nothing / Just を パターンマッチ使って場合分け"
 case percentage 20 50 of Nothing -> putStrLn "UNKNOWN"
                          Just x  -> print x

 putStrLn "■Data.Maybeモジュールを使ったパターンマッチを直接使わない形式"
 let p = percentage 20 50
 print $ if isNothing p then "UNKNOWN" else show (fromJust p)

 putStrLn "■maybe関数(fromJustはランタイムエラーの危険がある)"
 print $ maybe "UNKNOWN" show (percentage 20 50)


-- 以下関数

-- Nothing:エラー、値返却不可 / Just:コンストラクタとして利用することで値を返却
percentage k n | n == 0    = Nothing              :: Maybe Double
               | otherwise = Just (100.0 * k / n)