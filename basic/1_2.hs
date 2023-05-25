-- whereによる宣言では、右辺でのみ参照できる局所変数を宣言可能

main = do
 print (x + y)

-- パターン１
--  where {x = 10; y = 20}

-- パターン２
  where
   x = 10
   y = 20