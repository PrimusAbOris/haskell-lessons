import System.IO
import Control.Monad (void) -- see line 17

main :: IO ()
main = do
    putStrLn "Enter an integer:"
    input <- getLine
    let num = read input :: Integer
    let digitList = toDigits num
    putStrLn "List of digits:"
    print digitList
--    let digitListRev = toDigitsRev num
--    putStrLn "The reversed list of digits:"
--    print digitListRev
    putStr "Press any key to continue..."
    hFlush stdout
    void getChar  -- since IO is the method's type, it must end with an expression

toDigits :: Integer -> [Integer]
toDigits n
    | n < 1     = []
    | n < 10    = [n]
    | otherwise = toDigits (n `div` 10) ++ [n `mod` 10]

{-      cannot include in same program due to identical type declaration to toDigits
toDigitsRev :: Integer -> [Integer]
toDigitsRev n
    | n < 0     = error "Input must be a non-negative integer"
    | n < 10    = [n]
    | otherwise = reverse (toDigitsRev (n `div` 10) ++ [n `mod` 10])
-}


