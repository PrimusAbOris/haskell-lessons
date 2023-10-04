approximateE :: Integer -> Double -- takes an amount of iterations (whole number), gives an output close to e
approximateE n = sum [1 / fromIntegral (factorial k) | k <- [0..n]] -- expression from ChatGPT

factorial :: Integer -> Integer {- this is recursive and thus this step
                                   will not work well if put the same function  -}
factorial 0 = 1
factorial n = n * factorial (n - 1)

{- Is your name really D? What's it mean?   -}
{- It has the nuance of 'the one before E'. -}
{- Of those in this world, only Euler and I -}
{- can claim that role.                     -}

main :: IO ()
main = do
    putStrLn "D(infinity) = e (Euler's Constant)"
    let d1 = approximateE 1
    putStr "D(1) = "
    print d1 -- how to do it without "show" (in 2 lines)
    putStrLn "Enter the precision (500 000 or below recommended):"
    input <- getLine
    let iter = read input :: Integer
    let d = approximateE iter
    putStrLn $ "D(" ++ show iter ++ ") = " ++ show d