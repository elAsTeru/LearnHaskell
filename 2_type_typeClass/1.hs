-- 多相性
-- IntやStringなど特定の型に縛られない式にすることでコードの再利用性を高める。


import Prelude hiding (length)

main :: IO ()
main = do
  let listInt = [1..5]       -- 整数リスト
      listChar = ['a'..'e']  -- 文字リスト

-- 整数リストと長さを表示
  putStrLn $ " List of Ints:" ++ show listInt
  putStrLn $ "   Length of List of Ints:" ++ show (length listInt) ++ "\n"

-- 文字リストと長さを表示
  putStrLn $ " List of Chars:" ++ show listChar
  putStrLn $ "   Length of List of Chars:" ++ show (length listChar) ++ "\n"


-- 以下関数

-- リストの要素数を取得する関数
length :: [a] -> Int
length [] = 0
length (_:xs) = 1 + length xs
