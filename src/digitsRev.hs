import System.IO
import Control.Monad (void)

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

toDigitsRev :: Integer -> [Integer]
toDigitsRev n
    | n < 0     = []
    | n < 10    = [n]
    | otherwise = (n `mod` 10) : toDigitsRev (n `div` 10)

