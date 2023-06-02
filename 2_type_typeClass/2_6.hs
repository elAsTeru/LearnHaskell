-- 型制約

import Data.List (intercalate)

main :: IO()
main = do
  putStrLn "■型への型制約"
  sayHello (Human "takashi")
  putChar '\n'

  putStrLn "■class宣言における型制約"
  leaveWithLaugh (Human "takashi")
  putChar '\n'

  putStrLn "■instance宣言における型制約"
  sayHello [Human "atsuhiko", Human "shingo"]
  putChar '\n'


-- ■型クラスとインスタンスの定義
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

-- ■型への型制約
sayHello :: Greeting a => a -> IO()
sayHello x = putStrLn (hello x)

-- ■class宣言における型制約
-- laughメソッドを提供するLaughing型クラス(子)を定義
class Greeting a => Laughing a where
  laugh :: a -> String

instance Laughing Human where
  laugh _ = "Zehahahaha...!!"

leaveWithLaugh :: Laughing a => a -> IO()
leaveWithLaugh x = do
  putStrLn $ bye x
  putStrLn $ laugh x

-- ■ instance宣言における型制約
liftGreet :: (a -> String) -> ([a] -> String)
liftGreet f = intercalate "\n" . map f

instance Greeting a => Greeting [a] where
  name  = liftGreet name
  hello = liftGreet hello
  bye   = liftGreet bye