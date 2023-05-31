-- 再帰的な定義
-- forやwhileのようなループ構文が存在しない為、再帰によるループを行う。
import Control.Monad(when)

main :: IO()
main = do
 putStrLn "■n-1の階乗"
 print $ fact 10

 putStrLn "■FizzBuzz"
 loop 0


-- 以下関数
-- ■
fact :: Integer -> Integer
fact n
 | n <= 1    = n
 | otherwise = n * fact(n - 1)
-- ■FizzBuzz関数
loop :: Int -> IO()
loop n
 | n <= 20 = do
     when(n `mod` 3 /= 0 && n `mod` 5 /= 0) (putStr $ show n) 
     when(n `mod` 3 == 0)                   (putStr "Fizz")
     when(n `mod` 5 == 0)                   (putStr "Buzz")
     putStrLn ""
     loop(n + 1)
 | otherwise = return()