import System.Random
import Data.List

reverseBubbleSort :: [(String, Int)] -> [(String, Int)]
reverseBubbleSort ary = foldr (\pass sorted -> bubbleSort pass sorted) [] [0..length ary - 2]
  where
    bubbleSort pass sorted = foldr (\n acc -> swap n acc) sorted [0..length sorted - 1 - pass]
    swap n ary = let a = ary !! n
                     b = ary !! (n + 1)
                 in if snd a > snd b
                    then take n ary ++ [b, a] ++ drop (n + 2) ary
                    else ary

main :: IO ()
main = do
  let ary = [("test", 0)]
  randomGen <- newStdGen
  let numberAry = take (length ary) (randoms randomGen)
  let aryWithCount = zip (map fst ary) numberAry
  let sortedAry = reverseBubbleSort aryWithCount
  mapM_ (\(name, count) -> putStrLn ("Osobnik @" ++ name ++ "\tWygranych losowań: " ++ show count)) sortedAry
