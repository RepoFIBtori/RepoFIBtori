genera :: Int -> [a] -> [[a]]
genera i [] = []
genera 0 _ = [[]]
genera i (x:xs) = (map (\l -> x:l) $ genera (i-1) (x:xs))++(genera i xs)


genAllSize :: [a] -> [[a]]
genAllSize l = foldr (\i x -> (genera i l)++x) [] $ iterate (+1) 0
