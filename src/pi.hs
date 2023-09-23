approximatePi :: Integer -> Double -- takes an amount of iterations (whole number), gives an output close to pi
approximatePi n = 4.0 * sum [((-1) ^ k) / (2 * fromIntegral k + 1) | k <- [0 .. n]] -- expression from ChatGPT

main :: IO ()
main = do
    putStrLn "pyre(infinity) = pi"
    let pyre1 = approximatePi 1
    putStr "pyre(1) = "
    print pyre1 -- how to do it without "show" (in 2 lines)
    putStrLn "Enter the precision (500 000 or below recommended):"
    input <- getLine
    let iter = read input :: Integer
    let pyre = approximatePi iter
    putStrLn $ "pyre(" ++ show iter ++ ") = " ++ show pyre

{---*--------------------------*---------------------------*---}
{-  Right now, behind you...wasn't there something...?        -}
{-    It's telling me about you...                            -}
{-  You should walk away quickly and never once look back...  -}
{---*--------------------------*---------------------------*---}