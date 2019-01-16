eval1 :: String -> Int 
eval1 expr = evalCalc stack []
    where stack = words expr

evalCalc :: [String] -> [String]-> Int
evalCalc [] [x] = read x::Int --si només queda un
evalCalc (x:xs) stack 
    | x == "+"  = evalCalc xs (sumRes:rest)
    | x == "-"  = evalCalc xs (minRes:rest)
    | x == "*"  = evalCalc xs (mulRes:rest)
    | x == "/"  = evalCalc xs (divRes:rest)
    | otherwise = evalCalc xs (x:stack)
    where   a = head stack
            b = stack !! 1
            rest = drop 2 stack
            aInt = read a :: Int
            bInt = read b :: Int
            sumRes = show (bInt + aInt)
            minRes = show (bInt - aInt)
            mulRes = show (bInt * aInt)
            divRes = show (div bInt aInt)

eval2 :: String -> Int
eval2 expr = evalCalc2 reverse(stack) []
  where stack = words expr

  --acabar
evalCalc2 :: Char -> [String] -> Int
evalCalc2 op expr = foldl (evalCalc2)   
    where a = head expr
          b = expr !! 1
          result = op a b


fsmap:: a-> [a->a]->a 
fsmap x f = foldl (\x k-> k x) x f 
-- fsmap x fs = foldl (flip) x fs


divideNconquer:: :: (a -> Maybe b) -> (a -> (a, a)) -> (a -> (a, a) -> (b, b) -> b) -> a -> b
