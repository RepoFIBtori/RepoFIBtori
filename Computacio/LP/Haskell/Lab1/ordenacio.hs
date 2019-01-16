insert:: [Int] -> Int -> [Int]
insert [] y = [y]
insert (x:xs) y
    | x > y = (y:(x:xs))
    | otherwise = x:insert xs y
    
isort:: [Int] -> [Int]
isort [] = []
isort (x:xs) = insert (isort xs) x

remove:: [Int] -> Int -> [Int]
remove [] y = []
remove (x:xs) y
    | x == y = xs
    | otherwise = (x:(remove xs y))
    
ssort:: [Int] -> [Int]
ssort [] = []
ssort [x] = [x]
ssort (x:xs) 
    | m < x = m:(ssort(x:(remove (xs) m)))
    | otherwise = x:(ssort(xs))
    where
        m = minimum xs

merge:: [Int] -> [Int] -> [Int]
merge [] [] = []
merge [] (y:ys) = (y:ys)
merge (x:xs) [] = (x:xs)
merge (x:xs) (y:ys)
    | x > y = y:(merge (x:xs) ys)
    | otherwise = x:(merge xs (y:ys))
    
msort:: [Int] -> [Int]
msort [] = []
msort [x] = [x]
msort xs = merge (msort (take (div (length xs) 2) xs)) (msort (drop (div (length xs) 2) xs))

qsort:: [Int] -> [Int]
qsort [] = []
qsort (x:xs) = (qsort (menors xs x))++(x:(qsort (majors xs x)))

menors:: [Int] -> Int -> [Int]
menors [] y = []
menors (x:xs) y
    | x < y = x:(menors xs y)
    | otherwise = menors xs y

majors:: [Int] -> Int -> [Int]
majors [] y = []
majors (x:xs) y
    | x >= y = x:(majors xs y)
    | otherwise = majors xs y

genQsort:: Ord a => [a] -> [a]
genQsort [] = []
genQsort (x:xs) = (genQsort (genMenors xs x))++(x:(genQsort (genMajors xs x)))

genMenors:: Ord a => [a] -> a -> [a]
genMenors [] y = []
genMenors (x:xs) y
    | x < y = x:(genMenors xs y)
    | otherwise = genMenors xs y
    
genMajors:: Ord a => [a] -> a -> [a]
genMajors [] y = []
genMajors (x:xs) y
    | x >= y = x:(genMajors xs y)
    | otherwise = genMajors xs y
