-- get sum of multiples of a number
sumMultiples :: Integer -> Integer -> Integer
sumMultiples n f = f * n1 * (n1 + 1) `div` 2 
  where n1 = (n - 1) `div` f


-- 
sumMultiples35 :: Integer -> Integer
sumMultiples35 n = sumMultiples n 3 + sumMultiples n 5 - sumMultiples n 15




-- fibonaccio
fibs :: [Integer]
fibs = map fst $ iterate (\(a,b) -> (b,a+b)) (0,1)

fibonacci :: Int -> Integer
fibonacci n = fibs !! n



-- sum even fibonaccis
sumEvenFibonaccis :: Integer -> Integer
sumEvenFibonaccis n = foldl1 (+) $ filter even $ takeWhile (<n) fibs



-- largest prime factor

primes = 2 : 3 : filter ((==1).length.primeFactors) [5,7..]

primeFactors n = factor n primes
  where factor n (p:ps)
          | p*p>n = [n]
          | mod n p == 0 = p : factor (div n p) (p:ps)
          | otherwise      = factor n ps

largestPrimeFactor :: Int -> Int
largestPrimeFactor n = last $ primeFactors n



-- palindromic
isPalindromic :: Integer -> Bool
isPalindromic n = all (==True) $ zipWith (==) l (reverse l)
  where l = show n



