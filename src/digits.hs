import System.IO
import Control.Monad (void) -- see line 17

main :: IO () -- return type = empty result
main = do
    putStrLn "Enter an integer:"
    input <- getLine
    let num = read input :: Integer
    let digitList = toDigits num
    putStrLn "List of digits:"
    print digitList
    let digitListRev = toDigitsRev num
    putStrLn "The reversed list of digits:"
    print digitListRev
    putStr "Press any key to continue..."
    hFlush stdout
    void getChar  -- since IO is the method's type, it must end with an expression
    -- getChar is an input, but thanks to the ability to use a void return type (see line 2), it can be a simple pause

toDigits :: Integer -> [Integer]
toDigits n
    | n < 1     = []
    | n < 10    = [n]
    | otherwise = toDigits (n `div` 10) ++ [n `mod` 10]  -- using div 10 and mod 10 at once recursively separates the digits

toDigitsRev :: Integer -> [Integer]
toDigitsRev n = reverse (toDigits n)
