myMap::(a->b) -> [a] -> [b]
myMap f [] = []
myMap f (x:xs) = (f $ x):(myMap f xs)

myFilter::(a -> Bool) -> [a] -> [a]
myFilter f [] = []
myFilter f (x:xs)
	| f x = x:(myFilter f xs)
	| otherwise = myFilter f xs

myZipWith::(a -> b -> c) -> [a] -> [b] -> [c]
myZipWith f [] _ = []
myZipWith f _ [] = []
myZipWith f (x:xs) (y:ys) = (f x y):(myZipWith f xs ys)

parDiv::Int -> [Int] -> [(Int,Int)]
parDiv x [] = []
parDiv x (y:ys)
	| (mod x y) == 0 = (x,y):(parDiv x ys)
	| otherwise = parDiv x ys

thingify::[Int] -> [Int] -> [(Int,Int)]
thingify [] _ = []
thingify _ [] = []
thingify (x:xs) y = (parDiv x y) ++ (thingify xs y)

factors::Int -> [Int]
factors x = myFilter (\y -> (mod x y) == 0) [1..x]
