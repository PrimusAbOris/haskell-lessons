import System.IO
import Control.Monad (void)
-- see digits.hs for info
main :: IO ()
main = do
    putStrLn "Enter an integer:"
    input <- getLine
    let num = read input :: Integer
    let digitListRev = toDigitsRev num
    putStrLn "The reversed list of digits:"
    print digitListRev
    putStr "Press any key to continue..."
    hFlush stdout
    void getChar

toDigits :: Integer -> [Integer]
toDigits n
    | n < 1     = []
    | n < 10    = [n]
    | otherwise = toDigits (n `div` 10) ++ [n `mod` 10]

toDigitsRev :: Integer -> [Integer]
toDigitsRev n = reverse (toDigits n)