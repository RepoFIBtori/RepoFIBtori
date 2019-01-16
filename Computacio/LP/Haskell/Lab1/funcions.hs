--retorna la mida d'una llista
myLength :: [Int] -> Int
myLength [x] = 1
myLength (x:xs) = 1 + myLength xs

--retorna el màxim d'una llista
myMaximum :: [Int] -> Int
myMaximum [x] = x
myMaximum (x:xs)
    | x > m = x
    | otherwise = m
    where m = myMaximum xs

--retorna si el nombre y és múltiple d'algun dels nombres de la llista x
esMultiple::[Int] -> Int -> Bool
esMultiple [] _ = False
esMultiple (x:xs) y 
    | ((mod y x) /= 0) = esMultiple xs y
    | otherwise = True
