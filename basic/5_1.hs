-- リスト

main :: IO()
main = do
 putStrLn "■リスト"
 let list = [1, 2, 3, 4, 5] :: [Int]
 print list
 
 let list' = [1..5] :: [Int]         -- [1, 2, 3, 4, 5]と同義
 print list'

 putStrLn "■等差数列"
 let list2 = [1,3..10] :: [Int]
 print list2

 putStrLn "■要素の取り出し"
-- 無限リストから10001目の要素を取り出す
 let infinite = [1, 3..] :: [Int]
     element  = infinite !! 10000
 print element

 putStrLn "■head tail"
-- 空のリストを渡すとエラーが出るので注意
 print $ head list
 print $ tail list

 putStrLn "■map"
-- 関数とリストを引数に取り、リストのすべての要素に対して関数を適応
 let mapTest = map(2*) [1..10] :: [Int]
 print mapTest

 putStrLn "■filter"
-- Boolを返す関数とリストを引数に取り、Trueとなった要素だけからなる別のリストを返す関数。
 let filterTest = filter(\x -> x `mod` 3 == 0) [1..10]
 print filterTest

 putStrLn "■要素を全て集める"
-- rとlでそれぞれ連結方向が違う
 let right = foldr (-) 0 [1..10]
 print right
 let left  = foldl (-) 0 [1..10]
 print left

 putStrLn "■リストの連結"
-- ++演算子による連結
 let connection = "The list contains " ++ show [1, 2, 3] ++ "."
 print connection
-- concat関数による連結
 let connection' = concat ["The list contains ",show [1, 2, 3], "."]
 print connection'