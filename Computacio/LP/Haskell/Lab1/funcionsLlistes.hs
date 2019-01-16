--retorna la mida d'una llista
myLength :: [Int] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

--retorna el màxim d'una llista
myMaximum :: [Int] -> Int
myMaximum [x] = x
myMaximum (x:xs)
    | x > m = x
    | otherwise = m
    where m = myMaximum xs

--retorna un pair amb la suma i la mida d'una llista
sumLen :: [Int] -> (Int, Int)
sumLen [] = (0,0)
sumLen (x:xs) = (x+m,1+n)
    where y = sumLen xs
          m = fst y
          n = snd y

--realitza un canvi de variable de Int a Float
intToFloat::Int -> Float
intToFloat n = fromInteger (toInteger n)

--retorna la mitjana de          
average::[Int] -> Float
average [] = 0
average x = (intToFloat m) / (intToFloat n)
    where y = sumLen x
          m = fst y
          n = snd y

--retorna el palindrom d'una llista, començat per el revessat i acabant amb la llista
buildPalindrome::[Int] -> [Int]
buildPalindrome x = (reverse x) ++ x

--indica si un element y està a la llista x
esDins::[Int] -> Int -> Bool
esDins [] x = False
esDins (y:ys) x
    | y == x = True
    | otherwise = esDins ys x

--elimina tots els elements de la llista x que apareixen a la llista y
remove::[Int] -> [Int] -> [Int]
remove [] [] = []
remove [] y = []
remove x [] = x
remove (x:xs) y
    | not $ esDins y x = (x:(remove xs y))
    | otherwise = remove xs y

--aplana una llista de llistes en una sola llista	
flatten::[[Int]] -> [Int]
flatten [] = []
flatten (xs:ys) = xs ++ flatten ys

--separa la llista en parells i senars
oddsNevens::[Int] -> ([Int],[Int])
oddsNevens [] = ([],[])
oddsNevens (x:xs)
	| (mod x 2) /= 0 = (x:(fst y), snd y)
	| otherwise = (fst y, x:(snd y))
		where y = oddsNevens xs

--retorna si el nombre y és múltiple d'algun dels nombres de la llista x
esMultiple::[Int] -> Int -> Bool
esMultiple [] _ = False
esMultiple (x:xs) y 
	| ((mod y x) /= 0) = esMultiple xs y
	| otherwise = True 

--realitza el garbell d'eratostenes fins al nombre n
garbell::Int->[Int]
garbell n = foldl f [2] $ takeWhile (n >=) $ iterate (+1) 3
	where f x y
		|not $ esMultiple x y = x ++ (y:[])
		|otherwise = x

--retorna la llista infinita de nombres primers
primers::[Int]
primers = primes 3 [2]

--funció auxiliar de primers, empra el garbell d'eratostenes per a trobar primers
primes::Int -> [Int] -> [Int]
primes n [] = takeWhile (<= n) $ primes 3 [2]
primes 3 [2] = 2:(3:(primes 5 [2,3]))
primes x y
	| not $ esMultiple y x = x:(primes (x+1) (y ++ (x:[])))
	| otherwise = primes (x+1) y


--troba els divisors primers del nombre n
primeDivisors::Int -> [Int]
primeDivisors n = filter (f n) $ primes n []
	where f x y = (mod x y) == 0    

