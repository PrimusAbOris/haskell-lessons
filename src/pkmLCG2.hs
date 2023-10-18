-- Pokemon Emerald's LCG --
-- Specific frame version --
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
    putStrLn "How many frames have advanced since startup? "
    frame <- getLine
    let frameInt = read frame :: Int
    let seed = i
    let randomNumbers = take frameInt (lcg seed)
    let hexStrings = map (\x -> "0x" ++ showHex x "") randomNumbers
    let currState = last hexStrings
    putStrLn ("PRNG state at frame " ++ frame ++ ":")
    putStrLn currState