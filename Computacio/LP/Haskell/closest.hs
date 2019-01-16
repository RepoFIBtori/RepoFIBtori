dist::(Float,Float)->(Float,Float)->Float
dist (x1,x2) (y1,y2) = sqrt((y1-x1)*(y1-x1) + (y2-x2)*(y2-x2))


closest::[(Float, Float)] -> Float
closest [(x,y),(x1,y1)] = dist (x,y) (x1,y1) 
closest (l:ls)
    |a<b    =a
    |otherwise  =b
    where a= minimum (map (dist l) ls) 
          b = closest ls
         