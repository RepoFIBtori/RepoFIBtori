eval1:: String -> Int 
eval1 l = eval1aux (words l) []

eval1aux:: [String]->[Int]->Int
eval1aux [] stack= head stack
eval1aux l@(x:xs) stack
    |x == "+"   =eval1aux xs $(op1 + op2):stack'
    |x == "-"   =eval1aux xs $(op1 - op2):stack'
    |x == "*"   =eval1aux xs $(op1 * op2):stack'
    |x == "/"   =eval1aux xs $(op1 `div` op2):stack'
    |otherwise  =  eval1aux xs $(read (x)::(Int)):stack
        where 
            op2 = stack !! 0
            op1 = stack !! 1
            stack' = tail $ tail stack


eval2:: String -> Int
eval2 l = head $ foldl (eval2aux) [] (words l) 


eval2aux::[Int]->String->[Int]
eval2aux stack x
            |x == "+"   =(op1 + op2):stack'
            |x == "-"   =(op1 - op2):stack'
            |x == "*"   =(op1 * op2):stack'
            |x == "/"   =(op1 `div` op2):stack'
            |otherwise  =(read (x)::(Int)):stack
                where 
                    op2 = stack !! 0
                    op1 = stack !! 1
                    stack' = tail $ tail stack

fsmap::a->[a->a]->a
fsmap x f = foldl (\x k-> k x) x f 
-- fsmap x fs = foldl (flip) x fs


data Racional = Racional Integer Integer  
racional:: Integer -> Integer -> Racional
racional x y = Racional x y 

numerador :: Racional -> Integer
numerador r = x
                    where 
                        (Racional x y) = (racionalitzar r)

denominador ::Racional -> Integer
denominador r = y
                    where 
                        (Racional x y) = (racionalitzar r)

racionalitzar::Racional->Racional
racionalitzar (Racional a b) = (Racional (a `div` x) (b `div` x))
                        where x = gcd a b

instance Show (Racional) where
    show r = show (numerador r) ++ "/" ++ show (denominador r)

instance Eq (Racional) where 
   (==) r1 r2 
        |(numerador r1) == (numerador r2)  && (denominador r1) == (denominador r2) =True
        |otherwise  =False



data Tree a = Node a (Tree a) (Tree a)
recXnivells:: Tree a -> [a]
recXnivells t = recXnivells' [t]
    where recXnivells' ((Node x fe fd):ts) = x:recXnivells' (ts ++ [fe, fd])

racionals::[Racional]
racionals = racionals' [racional 1 1]
    where racionals' ((r@(Racional x y)):xs) = (racionalitzar r): (racionals' (xs ++ [racional x (x+y)] ++ [racional (x+y) y]))
