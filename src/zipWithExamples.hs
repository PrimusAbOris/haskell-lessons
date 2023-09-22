main :: IO ()
main = do
    let list01 = [1, 2, 3, 4, 5]
        list10 = [10,20,30,40,50]
        sumList = zipWith (+) list01 list10
        altList = formAltList list01
        notAltList2 = formAltList list01 ++ list10
        altList2 = formAltList (list01 ++ list10)
        alsoAltList2 = formAltList $ list01 ++ list10
        listSq = zipWith (^) list01 list01
        altList3 = formAltList(formAltList (listSq ++ list10))

    putStrLn "Result of zipWith (+):"
    print sumList

    putStrLn "Result of zipWith ($) (cycle [(*10), (*20), (+5), id, id, (+1)]):"
    print altList2

    putStrLn "And many, many more:"
    print(zipWith (-) [2,2,8] [3,1,72])
    print(zipWith (/) [20,5,8,3,4] [5,5,5,1,1])
    print(zipWith (/) [20,5,8,3,4] [5,5,5]) -- same output as line below
    print(zipWith (/) [20,5,8] [5,5,5])
    print listSq
    print altList3

formAltList :: [Integer] -> [Integer]
formAltList = zipWith ($) (cycle [(*10), (*20), (+5), id, id, (+1)]) -- 6 step cycle, doesn't depend on input list length
