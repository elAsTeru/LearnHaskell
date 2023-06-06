-- 例外処理
-- Haskellで安全なプログラムを書くには、ボトム(⊥)となるような式を避ける必要がある。しがし、IOを伴うプログラムではファイルの内容や入出力、さらにはネットワークやデータベースといったさまざまな状態が計算結果に影響を及ぼす。プログラムの誤りによって発生するものはプログラマの努力で避けることが可能だが、IO処理によるIO例外は努力しても避けることができない。なのでIOアクションを使う場合にはIO例外を適切に扱う必要がある。

{-# LANGUAGE ScopedTypeVariables #-} -- GHCの言語拡張を有効化
import Control.Exception

main :: IO()
main =
  (readFile "dummyFileName" >>= putStrLn)
-- 実行時にdummyFileNameの存在が確認できない場合にメッセージを表示する。
    `catch`
  (\(e  :: SomeException) ->
    putStrLn $ "readFile failure!! : " ++ displayException e)
-- finally例外：例外の有無にかかわらずメッセージを表示する。
    `finally`
  (putStrLn "finalization!!")

