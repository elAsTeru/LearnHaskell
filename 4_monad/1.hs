-- Monad : 特定の処理を手続的に書けるようにする機能

import Control.Monad.Trans.State
import Data.List
-- random-shuffleパッケージ内にあるshuffleM関数を使うことでランダムにシャッフルできる。(stack install random-shuffle コマンドでインストールの必要がある。)
import System.Random.Shuffle (shuffleM)

main :: IO()
main = do
  deck <- shuffleM [1..50]    -- ランダムシャッフルされた山札
  print $ runState gameWithState deck

type Card   = Int     -- カード
type Score  = Int     -- 得点
type Hand   = [Card]  -- 手札
type Stock  = [Card]  -- 山札
type Player = String  -- プレイヤー

-- 山札から指定した枚数のカードを引く
drawCards :: Int -> State Stock Hand  -- 状態は山札、返り値は手札
drawCards n = do
  deck <- get           -- 状態である山札を取得
  put $ drop n deck     -- 引いた残りを新たに山札に設定
  return $ take n deck  -- 引いたカードを返す

gameWithState :: State Stock [(Score, Player, Hand)]
gameWithState = do
  -- 4人分のカードを配る
  taroHand    <- drawCards 5
  hanakoHand  <- drawCards 5
  takeshiHand <- drawCards 5
  yumiHand    <- drawCards 5
  -- 逆順にソートすることで合計得点が高い順に並ぶ
  return . reverse . sort $
    [ 
      (sum taroHand, "Taro", taroHand),
      (sum hanakoHand, "Hanako", hanakoHand),
      (sum takeshiHand, "Takeshi", takeshiHand),
      (sum yumiHand, "Yumi", yumiHand)
    ]
