import Data.Char (isDigit)

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther = zipWith ($) (cycle [id, (*2)])

remainderAndConditional :: Integer -> (Integer, Bool)
remainderAndConditional n =
  let remainder = n `mod` 10
      isZero = remainder == 0  -- needs to be indented far enough to be within the "let" block
  in (remainder, isZero)

main :: IO ()
main = do
  putStrLn "Please enter a 16-digit number:"
  userInput <- getLine

  if isValid16DigitNumber userInput
    then do
      let digitList = map digitToInt userInput
      putStrLn "You entered a valid 16-digit number:"
      print digitList
    else
      putStrLn "Invalid input. Please enter a 16-digit number."
  let intList = [1, 2, 4, 8, 16, 32] -- doesn't ask the user for a number yet
  let doubledList = doubleEveryOther intList
  let totalSum = sum doubledList
  let (remainder1, isZero1) = remainderAndConditional totalSum
  putStrLn $ "The number is " ++ if isZero1 then "VALID" else "INVALID"
  
isValid16DigitNumber :: String -> Bool
isValid16DigitNumber str =
  length str == 16 && all isDigit str

digitToInt :: Char -> Int
digitToInt c = fromEnum c - fromEnum '0'
