import System.IO
import Data.Time
import System.Console.ANSI

main :: IO ()
main = do
    currentTime <- getCurrentTime
    let formattedDate = formatTime defaultTimeLocale "%m-%d-%Y" (utctDay currentTime)
    putStrLn $ "Current date: " ++ formattedDate

    putStrLn "Choose a text type:"
    putStrLn "1. Multi-voice"
    putStrLn "2. Single-voice"
    putStrLn "3. Mixed-voice"
    option <- getOption
    case option of
        "1" -> processOption ("D " ++ formattedDate ++ ".txt")
        "2" -> processOption ("E " ++ formattedDate ++ ".txt")
        "3" -> processOption ("N " ++ formattedDate ++ ".txt")
        _   -> putStrLn "Invalid option." --test with and without

    clearScreen
    putStrLn "It begins! Enter a line of text (type 'done' to quit):"
    appendLineToFile ("D " ++ formattedDate ++ ".txt") --account for all three
    where
        appendLineToFile :: FilePath -> IO () --consider defining the method below
        appendLineToFile filePath = do
            input <- getLine
            if input == "done"
                then putStrLn "So it is." --this doesn't appear
                else do
                    appendFile filePath (input ++ "\n")
                    appendLineToFile filePath

getOption :: IO String
getOption = do
    input <- getLine
    if input `elem` ["1", "2", "3"]
        then return input
        else do
            putStrLn "Invalid option. Please choose 1, 2, or 3."
            getOption

processOption :: FilePath -> IO ()
processOption filePath = do
    putStrLn $ "You chose option " ++ filePath
    putStrLn "Enter data to write to the file (or type 'done' to quit):"
    appendDataToFile filePath

appendDataToFile :: FilePath -> IO ()
appendDataToFile filePath = do
    input <- getLine
    if input == "done"
        then putStrLn "So it is!"
        else do
            appendFile filePath (input ++ "\n")
            appendDataToFile filePath

