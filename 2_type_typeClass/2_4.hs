-- 型の別名：型に別の名前を付ける
-- 型名が長すぎて可読性を損ねていたり、同じ形式でもデータの持つ意味合いが違ったりする場合に、型に別の名前を付けられると便利。

main :: IO()
main = do
  putStrLn "■typeキーワード"
  let age = 24 :: Age
  let n   = -1 :: Integer

  print $ legalDrink age
  print $ legalDrink n
  putChar '\n'

  putStrLn "■部分適用を施した型シノニム"
  print $ safeHead [1, 2, 3]
--  print $ safeHead []
  putChar '\n'


-- 以下関数等

-- ■typeキーワードを使うと型に別名を付けられる。これを型シノニムと呼ぶ。
type Age = Integer -- typeに続き左辺に新しい型名、右辺に元々の型名を書く

legalDrink :: Age -> Bool
legalDrink age | age >= 20 = True
               | otherwise = False

-- 部分適応を施した型シノニム
-- Either a b型と自前のAppErr型をエラーとして使う場合、毎回Either AppErrと型コンストラクタを記述する必要があるが、Either型にAppErrを部分適応したAppResultという型シノニムを用いることで型の表記を簡潔にできる。
data AppErr = NewAppErr deriving Show
type AppResult a = Either AppErr a

-- AppResultを用いた、[]に関してもボトムを返さないようなより安全なheadの定義を書ける。
safeHead :: [a] -> AppResult a
safeHead [] = Left NewAppErr
safeHead xs = Right (head xs)


-- ■newtypeで定義された方は、元の型とは別の型になる。
-- newtype 型コンストラクタ名 = データコンストラクタ名 型
newtype NTIndexed a = NewNTIndexed (Integer, a) deriving Show