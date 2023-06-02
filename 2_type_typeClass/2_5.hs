-- 型クラス

main :: IO()
main = do
  putStrLn "■型クラスとインスタンスの定義"
  putStrLn $ hello(Human "takeshi")
  putStrLn $ hello Dog
  putStrLn $ hello Cat
  putStrLn $ bye  (Human "takeshi")
  putStrLn $ bye   Dog
  putStrLn $ bye   Cat
  putChar '\n'


-- 型クラスとインスタンスの定義
-- 3種類の動物をdataで定義。Humanのみ名前を所有
data Dog   = Dog          deriving Show
data Cat   = Cat          deriving Show
data Human = Human String deriving Show

-- 型クラスの定義
class Greeting a where -- class 型クラス名 型変数名 where
  name  :: a -> String -- 関数名 :: 型名
  hello :: a -> String
  hello _ = "..."      -- hello関数のデフォルト実装
  bye   :: a -> String
  bye   _ = "..."      --  bye 関数のデフォルト実装

-- インスタンスの定義
instance Greeting Human where
  name  (Human n) = n
  hello h         = "Hi, I'm " ++ name h ++ "." 
  bye   _         = "See you."

instance Greeting Dog where
  name  _ = "a dog"
  hello _ = "Bark!"

instance Greeting Cat where
  name  _ = "a cat"
  bye _ = "Meow..."