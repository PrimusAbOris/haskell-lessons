import System.IO
import Control.Monad (void)

intList :: [Integer]
intList = [1, 1, 1, 1, 1, 1, 1, 1, 1] -- initializing the list; these values won't appear in runtime
main :: IO ()
main = do
    let intList = [1, 2, 4, 8, 16, 32] -- 'let' operator needed in do block
    putStrLn "List of numbers input: "
    print intList
    let totalSum = sum intList
    putStrLn "Sum of numbers input: "
    print totalSum
    putStr "Press any key to continue..."
    hFlush stdout
    void getChar