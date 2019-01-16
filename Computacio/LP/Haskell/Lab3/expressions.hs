data Expr = Val Int | Add Expr Expr | Sub Expr Expr | Mul Expr Expr | Div Expr Expr

eval1::Expr -> Int
eval1 (Val x) = x
eval1 (Add x y) = (eval1 x) + (eval1 y)
eval1 (Sub x y) = (eval1 x) - (eval1 y)
eval1 (Mul x y) = (eval1 x) * (eval1 y)
eval1 (Div x y) = div (eval1 x) (eval1 y)

eval2::Expr -> Maybe Int
eval2 (Val x) = Just x
eval2 (Add x y) = aux (+) x y
eval2 (Sub x y) = aux (-) x y
eval2 (Mul x y) = aux (*) x y
eval2 (Div x y) = do a <- eval2 x
                     b <- eval2 y
                     if b /= 0 then return(div a b) else Nothing
                     
aux::(Int -> Int -> Int) -> Expr -> Expr -> Maybe Int
aux op x y = do a <- eval2 x
                b <- eval2 y
                return(op a b)
                
eval3::Expr -> Either String Int
eval3 (Val x) = Right x
eval3 (Add x y) = do a <- eval3 x
                     b <- eval3 y
                     Right(a + b)
eval3 (Sub x y) = do a <- eval3 x
                     b <- eval3 y
                     Right(a - b)
eval3 (Mul x y) = do a <- eval3 x
                     b <- eval3 y
                     Right(a * b)
eval3 (Div x y) = do a <- eval3 x
                     b <- eval3 y
                     if b/= 0 then Right(div a b) else Left("div0")
