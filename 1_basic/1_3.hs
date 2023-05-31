-- let は where と同様に局所変数を宣言するときに使う。

main = do
 let x = 10
     y = 20
 print (x + y)