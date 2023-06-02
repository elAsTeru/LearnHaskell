-- レコード記法
-- data 型コンストラクタ名 = データコンストラクタ名 {フィールド名::型名1, フィールド名::型名2}
 
data Employee = NewEmployee
  {
    employeeAge       :: Integer,
    employeeIsManager :: Bool,
    employeeName      :: String
  } deriving (Show)

employee :: Employee
employee = NewEmployee
  {
    employeeName      = "Subhash Khot",
    employeeAge       = 39,
    employeeIsManager = False
  }

-- フィールドの値の差し替え
employee' :: Employee
employee' = employee
  {
    employeeIsManager = True,
    employeeAge       = employeeAge employee + 1
  }


main :: IO()
main = do
  putStrLn "■フィールドへのアクセス"
  putStrLn $ show $ employeeAge       employee
  putStrLn $ show $ employeeIsManager employee
  putStrLn $        employeeName      employee
  putChar '\n'

  putStrLn "■フィールドの値の差し替え" 
  putStrLn $ show $ employeeAge       employee'
  putStrLn $ show $ employeeIsManager employee'
  putStrLn $        employeeName      employee'
  putStrLn $ show $ employeeAge       employee  　-- 元の値は書き換わらず