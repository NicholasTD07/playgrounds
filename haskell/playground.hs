doubleMe x = x + x

doubleUs x y = x + x + y + y

doubleUs2 x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
                        then x
                        else x*2

nick'T = "It's a-me, Nick T!"

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x ]

length' xs = sum [ 1 | _ <- xs ]

removeUppercase st = [ c | c <- st, not (c `elem` ['A'..'Z']) ]

evenNumbers xs = [ x | x <- xs, even x ]

rightTriangles max = [ (a, b, c) | a <- [1..max], b <- [1..max], c <- [1..max], a^2 + b^2 == c^2 ]

isRightTriangle a b c = a^2 + b^2 == c^2

