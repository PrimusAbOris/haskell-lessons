main :: IO ()
main = do
    let inputList = [8, 7, 6, 5]
    let inputList2 = [1, 4, 3]
    let inputList3 = [192, 255, 51] -- $C0FF33
    let doubledList = doubleEveryOther inputList
    let doubledList2 = doubleEveryOther inputList2
    let doubledList3 = doubleEveryOther inputList3
    putStrLn "Original lists:"
    print inputList
    print inputList2
    print inputList3
    putStrLn "Doubled lists:"
    print doubledList
    print doubledList2
    print doubledList3


doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther = zipWith ($) (cycle [id, (*2)]) -- id = identity; does nothing; returns what's put in
