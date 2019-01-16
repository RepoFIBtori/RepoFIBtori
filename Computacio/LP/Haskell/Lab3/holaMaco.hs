main = do
    x <- getLine
    f <- if x == "" then return ("") else if last x == 'a' || last x == 'A' then return "Hola maca!" else return "Hola maco!"
    putStrLn f
