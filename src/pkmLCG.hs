-- Pokemon Emerald's LCG --
import Data.Word
import Numeric (showHex)

a :: Word32 -- Multiplier
a = 0x41C64E6D

c :: Word32 -- Increment
c = 0x6073

p :: Word32 -- Period/Modulus
p = (2^32)-1

i :: Word32 -- Initial seed
i = 0

lcg :: Word32 -> [Word32]
lcg seed = iterate (\xn -> (a * xn + c) `mod` p) seed

main :: IO ()
main = do
    let seed = i
    let randomNumbers = take 10 (lcg seed)
    let hexStrings = map (\x -> "0x" ++ showHex x "") randomNumbers
    putStrLn "First ten states of Pokemon Emerald's LCG:"
    mapM_ putStrLn hexStrings -- for every...do this and without need for a return value