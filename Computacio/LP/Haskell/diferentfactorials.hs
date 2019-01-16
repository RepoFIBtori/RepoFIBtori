fact1 :: Integer -> Integer
fact1 1 = 1
fact1 n = n* fact1 (n-1)

fact2 :: Integer -> Integer
fact2 n
    | n == 1 =1
    | otherwise = n* fact2 (n-1)


fact3 :: Integer -> Integer
fact3 n =
        if (n == 1) then 1
        else n* fact3 (n-1)

fact4 :: Integer -> Integer
fact4 n = foldl (*) 1 [1..n]


fact5 :: Integer -> Integer
fact5 1 = 1
fact5 n =  fact1 (n-1) *n

fact6 :: Integer -> Integer
fact6 n = product [1..n]

fact7 :: Integer -> Integer
fact7 n = fst ((take (fromIntegral n+1) (iterate (\(m,p) -> (m*p,p+1)) (1,1)) ) !! (fromIntegral n))

fact8 :: Integer -> Integer
fact8 n = (scanl (*) 1 [1..]) !! fromIntegral n

fact9 :: Integer -> Integer
prod :: [Integer] -> Integer
prod [x] = x
prod (x:xs) = x * prod(xs)
fact9 x = prod[1..x]