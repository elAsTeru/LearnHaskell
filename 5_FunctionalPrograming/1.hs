-- ADT(代数的データ型、algebraic data type)による表現
-- 直積型、直和型、再帰型を用いて様々な構造の表現が可能

data Employee = Employee
  {
    name :: String,
    age  :: Int,
    role :: Role
  }
data Role = Engineers | Sales | Designers