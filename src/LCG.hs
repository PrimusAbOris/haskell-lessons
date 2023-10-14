import Data.Word -- What it says on the tin

a :: Word32 -- Multiplier
-- Must be relatively prime to p; in this case, odd
-- Larger number = "more random"
a = 1221221225

c :: Word32 -- Increment
-- Must be odd
c = 1013904223

p :: Word32 -- Period/Modulus
p = fromIntegral(2^32) - 1

i :: Word32 -- Initial seed
i = 0x5A0 -- dec 1440

lcg :: Word32 -> [Word32] -- The formula itself
lcg seed = iterate (\xn -> (a * xn + c) `mod` p) seed

main :: IO ()
main = do
    let seed = i
    let randomNumbers = take 0x3E8 (lcg seed) -- dec 1000 results
    print randomNumbers