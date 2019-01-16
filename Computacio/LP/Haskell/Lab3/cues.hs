data Queue a = Queue [a] [a] deriving (Show)

create::Queue a
create = Queue [] []

push::a -> Queue a -> Queue a
push x (Queue y z) = Queue y (x:z)

moveQ::Queue a -> Queue a
moveQ (Queue [] []) = Queue [] []
moveQ (Queue [] y) = Queue (reverse y) []
moveQ (Queue x []) = Queue x []
moveQ (Queue x y) = Queue (x++(reverse y)) []

pop::Queue a -> Queue a
pop (Queue [] []) = Queue [] []
pop (Queue [] (y:ys)) = pop $ moveQ $ Queue [] (y:ys)
pop (Queue (x:xs) y) = Queue xs y

top::Queue a -> a
--top (Queue [] []) = null
top (Queue [] (y:ys)) = top $ moveQ $ Queue [] (y:ys)
top (Queue (x:xs) y) = x

empty::Queue a -> Bool
empty (Queue [] []) = True
empty (Queue _ _) = False

first::Queue a -> [a]
first (Queue x _) = x

second::Queue a -> [a]
second (Queue _ y) = y

instance Eq a => Eq (Queue a) where
    x == y = (first (moveQ x) == first (moveQ y))
