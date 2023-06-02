-- 代数的データ型の定義
-- データコンストラクタを使用する。
-- data 型コンストラクタ名 = データコンストラクタ名 フィールド1 フィールド2 ...

-- 色を表す代数的データ型
data Color = Red | Green | Blue deriving (Show)

-- 自然数を表す代数的データ型
data Nat = Zero | Succ Nat deriving (Show)

-- 3次元ベクトルを表す代数的データ型
data Vector3D = Vec3D Double Double Double deriving (Show)

-- 木構造を表す代数的データ型
data Tree a = Leaf a | Node (Tree a) (Tree a) deriving (Show)

-- 正確性フラグ...型の前に正確性フラグ(!)をつけることで正格になる。
data LazyAndStrict = LazyAndStrict
                     {
                       lsLazy :: Int,
                       lsStrict :: !Int
                     }

main :: IO ()
main = do
  putStrLn "■色の値を使用"
  let color = Red
  putStrLn $ "Selected color: " ++ show color ++ "\n"

  putStrLn "■自然数を使用"
  let number = Succ (Succ Zero)
  putStrLn $ "Selected number: " ++ show number ++ "\n"

  putStrLn "■3次元ベクトルを使用"
  let vector = Vec3D 3.0 1.0 4.0
  putStrLn $ "Selected vector: " ++ show vector ++ "\n"

  putStrLn "■木構造を使用"
  let tree = Node (Leaf 1) (Node (Leaf 2) (Leaf 3))
  putStrLn $ "Selected tree: " ++ show tree ++ "\n"

  putStrLn "■正確性フラグ第一引数"
  print $ lsStrict $ LazyAndStrict undefined 2
  putChar '\n'

  putStrLn "■正確性フラグ第二引数はエラーになる(コメントアウト)"
--  print $ lsStrict $ LazyAndStrict undefined