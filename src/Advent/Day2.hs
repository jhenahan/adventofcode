{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RecordWildCards   #-}
module Advent.Day2 where

import           BasePrelude
import           Data.List.Split

data BoxDimensions = Dim { l :: Integer
                         , w :: Integer
                         , h :: Integer
                         }

splitDimensions :: String -> [Integer]
splitDimensions = map read . splitOn "x"

mkDim :: [Integer] -> BoxDimensions
mkDim [x,y,z] = Dim x y z


sumDimensions :: BoxDimensions -> Integer
sumDimensions dim@Dim {..} = (sum . map (*2)) area + minimum area
  where area = [l * w, w * h, h * l]

shortestRibbon :: BoxDimensions -> Integer
shortestRibbon dim@Dim {..} = ribbonLength + bow
  where ribbonLength = (sum . map (*2)) ribbon
        ribbon = (take 2 . sort) dims
        bow = product dims
        dims = [l, w, h]

day2part1 :: String -> Integer
day2part1 = sumDimensions . mkDim . splitDimensions

day2part2 :: String -> Integer
day2part2 = shortestRibbon . mkDim . splitDimensions

run :: IO ()
run = do
  file <- readFile "input.txt"
  print $ (sum . map day2part1 . words) file
  print $ (sum . map day2part2 . words) file
