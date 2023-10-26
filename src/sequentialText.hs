import System.IO

main :: IO ()
main = do
    putStrLn "Enter a line of text (type 'done' to quit):"
    appendLineToFile "o.txt"
    where
        appendLineToFile :: FilePath -> IO ()
        appendLineToFile filePath = do
            input <- getLine
            if input == "done"
                then putStrLn "So it is."
                else do
                    appendFile filePath (input ++ "\n")
                    appendLineToFile filePath
