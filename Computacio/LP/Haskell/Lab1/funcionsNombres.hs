absValue :: Int -> Int
absValue m
    | m < 0 = -m
    | otherwise = m
    
power :: Int -> Int -> Int
power x 0 = 1
power x p
    | mod p 2 == 0 = power (x*x) (p `div` 2)
    | otherwise = x * power x (p-1) 

isPrime :: Int -> Bool
isPrime 0 = False
isPrime 1 = False
isPrime x = not (hasDivisors x 2)

hasDivisors :: Int -> Int -> Bool
hasDivisors x n
    | n*n > x = False
    | mod x n == 0 = True
    | otherwise = hasDivisors x (n+1)

slowFib :: Int -> Int
slowFib 0 = 0
slowFib 1 = 1
slowFib n = slowFib (n-1) + slowFib(n-2)

quickFib :: Int -> Int
quickFib n = fst $ fibonacci n

fibonacci :: Int -> (Int, Int)
fibonacci 0 = (0,1)
fibonacci 1 = (1,1)
fibonacci n = (seg, res)
    where x = fibonacci $ n - 1
          seg = snd x
          res = (fst x) + (snd x)
    
