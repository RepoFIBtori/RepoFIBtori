eql::[Int]->[Int]->Bool
eql x y = (length x == length y) && (and $ zipWith (==) x y)

prod::[Int]->Int
prod x = foldl (*) 1 x

prodOfEvens::[Int]->Int
prodOfEvens x = prod $ filter even x

powersOf2::[Int]
powersOf2 = iterate (*2) 1

scalarProduct::[Float]->[Float]->Float 
scalarProduct x y = sum $ zipWith (*) x y 

flatten::[[Int]]->[Int]
flatten x = foldl (++) [] x

myLength::String->Int
myLength [] = 0
myLength x = last $ zipWith (f) x (iterate (+1) 1)
    where f a b = b
          
myReverse::[Int]->[Int]
myReverse x = foldr (f) [] x
    where f a b = (++) b [a]
          
countIn::[[Int]]->Int->[Int]
countIn l x = map (f x) l
    where f a b = length $ filter (== a) b
          
firstWord::String->String
firstWord x = takeWhile (/= ' ') $ dropWhile (== ' ') x
