elems::String -> [String]
elems [] = [[]]
elems (' ':xs) = []:(elems xs)
elems (x:xs) = (\(y:ys) c -> (c:y):ys) (elems xs) x

eval1::String -> Int
eval1 s = evaluar [0] $ elems s
	where
	evaluar (p:ps) [] = p
	evaluar p (x:xs)
		| x == "+" = (\(p1:p2:ps) -> evaluar ((p1+p2):ps) xs) p
		| x == "-" = (\(p1:p2:ps) -> evaluar ((p2-p1):ps) xs) p
		| x == "*" = (\(p1:p2:ps) -> evaluar ((p1*p2):ps) xs) p
		| x == "/" = (\(p1:p2:ps) -> evaluar ((div p2 p1):ps) xs) p
		| otherwise = evaluar (((read x)::Int):p) xs

eval2::String -> Int
eval2 s = (\(x:xs) -> x) $ foldl (evaluar) [0] $ elems s
	where
	evaluar p e
		| e == "+" = (\(p1:p2:ps) -> ((p1+p2):ps)) p
		| e == "-" = (\(p1:p2:ps) -> ((p2-p1):ps)) p
		| e == "*" = (\(p1:p2:ps) -> ((p1*p2):ps)) p
		| e == "/" = (\(p1:p2:ps) -> ((div p2 p1):ps)) p
		| otherwise = (((read e)::Int):p)

fsmap :: a -> [a -> a] -> a
fsmap x fs = foldl (\p f -> f p) x fs

------------------------------------------------------------------------

divideNconquer::(a -> Maybe b) -> (a -> (a,a)) -> (a -> (a,a) -> (b,b) -> b) -> a -> b
divideNconquer base divide conquer x
	| f (base x) = conquer x (divide x) (divideNconquer base divide conquer (fst $ divide x),divideNconquer base divide conquer (snd $ divide x))
	| otherwise = (\(Just y) -> y) (base x)
		where
		f Nothing = True
		f _ = False
		
quickSort::[Int]->[Int]
quickSort l = divideNconquer base divide conquer l
	where
	base [] = Just []
	base [x] = Just [x]
	base _ = Nothing
	divide x = ((filter ((x!!(div (length x) 2))>) x),(filter ((x!!(div (length x) 2))<) x))
	conquer x _ con = (fst con)++(filter ((x!!(div (length x) 2))==) x)++(snd con)

------------------------------------------------------------------------

data Racional = Racional Integer Integer

instance Show Racional where
	show r = (show $ numerador r)++"/"++(show $ denominador r)

instance Eq Racional where
	(==) a b = (numerador a == numerador b)&&(denominador a == denominador b)

racional :: Integer -> Integer -> Racional
racional num den = Racional num den

numerador :: Racional -> Integer
numerador (Racional num den) = div num $ gcd num den

denominador :: Racional -> Integer
denominador (Racional num den) = div den $ gcd num den

------------------------------------------------------------------------

data Tree a = Node a (Tree a) (Tree a)

recXnivells :: Tree a -> [a]
recXnivells t = recXnivells' [t]
	where recXnivells' ((Node x fe fd):ts) = x:recXnivells' (ts ++ [fe,fd])
	
racionals::[Racional]
racionals = racionals' [(Racional 1 1)]
	where racionals' ((x@(Racional a b)):ts) = x:(racionals' (ts ++ [(Racional a (a+b)),(Racional (a+b) b)]))
