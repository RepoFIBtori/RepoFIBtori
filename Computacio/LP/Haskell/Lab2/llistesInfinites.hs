ones::[Integer]
ones = 1:ones

nats::[Integer]
nats = 0:(map (+1) nats)

ints::[Integer]
ints = tail $ foldr (++) [] $ map (\x -> [x,-x]) nats

poty::Integer->[Integer]
poty y = 1:(map (*y) $ poty y)

merge::[Integer]->[Integer]->[Integer]
merge [] [] = []
merge x [] = x
merge [] y = y
merge (x:xs) (y:ys)
    | x < y = x:(merge xs (y:ys))
    | x == y = x:(merge xs ys)
    | otherwise = y:(merge (x:xs) ys)

hammings::[Integer]
hammings = 1:(merge (map (*2) hammings) $ merge (map (*3) hammings) $ map (*5) hammings)
