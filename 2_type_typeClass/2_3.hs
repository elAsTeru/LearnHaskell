-- 再帰的な定義
-- 再帰的な定義によって任意の大きさを持つコンテナを表現可能。コンストラクタが非正規のため、有限でない大きさのデータ構造であっても自然に扱える。


-- ここで実装したような辞書はよく使われるデータ構造であるため、GHCに同梱されているcontainersパッケージの中に、Data.Mapという効率のいい実装が定義されている。普段はこちらを使う。
main :: IO()
main = do
 print $ lookup' "hiratara" dict
 print $ lookup' "pinnyu"   dict


-- 以下関数


-- ■2分木辞書(データコンストラクタ) k:キー v:値
-- キーと値を持つノードからなる辞書なので、TDNodeコンストラクタで表す。
-- 各ノードは2つの枝を所有、自身より小さいキーを左側に、大きいキーを右側に持つ。-- 枝が存在しない末端はTDEmptyコンストラクタで表す。
-- TDNodeの第3・4引数で自身の型を2回参照することで、再帰構造により任意の個数のエントリを格納可能。
data TreeDict k v = TDEmpty
                  | TDNode k v (TreeDict k v) (TreeDict k v)
                  deriving (Show)

-- ■辞書にデータを格納するための関数
-- 3つの引数(登録するキーと値、挿入先のTreeDict)を取り、新しいTreeDictを返す関
insert :: Ord k => k -> v -> TreeDict k v -> TreeDict k v
-- 第3引数のTreeDictの型でinsertの実装を分ける
-- TDEmptyコンストラクタの場合：新しいノードを生成後キーと値を格納
insert k v TDEmpty = TDNode k v TDEmpty TDEmpty
-- TDNodeコンストラクタの場合：既存のノードのキーの大小を見て左右のどちらかへinsertを使って値を登録する。kとk'が同じ値の場合はk'をコピーし、値のみ新規に設定
insert k v (TDNode k' v' l r)
  | k < k'    = TDNode k' v' (insert k v l) r
  | k > k'    = TDNode k' v' l              (insert k v r)
  | otherwise = TDNode k' v' l              r


-- ■辞書の登録。
dict :: TreeDict String Integer
dict = insert "hiratara" 39
     . insert "shu1"      0
     . insert "masahiko" 64
     $ TDEmpty


-- ■TreeDictとキーを受け取って値を返す関数
-- 辞書内に値が存在しないことがあるので、Maybe v型を採用。
lookup' :: Ord k => k -> TreeDict k v -> Maybe v
lookup' _ TDEmpty = Nothing
lookup' k (TDNode k' v' l r)
  | k < k'    = lookup' k l
  | k > k'    = lookup' k r
  | otherwise = Just v'