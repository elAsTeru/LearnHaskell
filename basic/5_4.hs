-- Either a b型
-- エラーが発生する可能性のある処理の返り値として使われる。
-- Either型の値を作るコンストラクタは2つあり、正常時の値はRight、異常時の値はLeftで包んで表現する。


import Data.Either

main :: IO()
main = do
 putStrLn "■Either型"
 case percentage 20 50 of 
  Left err -> putStrLn err
  Right x  -> putStrLn $ show x

 putStrLn "■Data.Eitherモジュール"
 print $ either id show(percentage 20 50)

-- 以下関数

percentage :: Double -> Double -> Either String Double
percentage k n
 | n == 0    = Left "Illegal division by zero"
 | otherwise = Right (100 * k / n)