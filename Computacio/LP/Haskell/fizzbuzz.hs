fizzBuzz :: [Either Int String]
fizzBuzz = map fizzBuzz1 (iterate (+1) 0)
    where fizzBuzz1 n
            | (mod n 15)==0  = Right "FizzBuzz"
            | (mod n 3)==0   = Right "Fizz"
            | (mod n 5)==0   = Right "Buzz"
            | otherwise  =Left n

