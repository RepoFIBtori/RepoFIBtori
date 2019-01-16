data Tree a = Node a (Tree a) (Tree a) | Empty deriving (Show)

size::Tree a -> Int
size Empty = 0
size (Node x l r) = 1 + size l + size r

height::Tree a -> Int
height Empty = 0
height (Node x l r) = 1 + max (height l) (height r)

equal::Eq a => Tree a -> Tree a -> Bool
equal Empty Empty = True
equal Empty _ = False
equal _ Empty = False
equal (Node x l r) (Node y e d) = (x == y) && (equal l e) && (equal r d)

isomorphic::Eq a => Tree a -> Tree a -> Bool
isomorphic Empty Empty = True
isomorphic Empty _ = False
isomorphic _ Empty = False
isomorphic (Node x l r) (Node y e d) = (x == y) && (((isomorphic l e) && (isomorphic r d)) || ((isomorphic l d) && (isomorphic r e)))
