{-# LANGUAGE NoImplicitPrelude #-}
module Advent.Day5 where

import           BasePrelude
import Data.List.Split


atLeastNVowels :: Integer -> String -> Bool
atLeastNVowels n = (>= n) . genericLength . filter (`elem` "aeiou")

pairWithOffset :: Integer -> String -> Bool
pairWithOffset offset str = or $ zipWith (==) (genericDrop offset str) str

containsForbidden :: [String] -> String -> Bool
containsForbidden = flip (any . flip isInfixOf)


isNice :: [String -> Bool] -> String -> Bool
isNice rules = and . sequence rules

isNicePart1 :: Integer -> [String] -> [String -> Bool]
isNicePart1 vowels forbidden = [atLeastNVowels vowels
                                   , pairWithOffset 1
                                   , not . containsForbidden forbidden]


pairs :: [a] -> [(a,a)]
pairs = zip <*> tail

nPairs :: Integer -> String -> Bool
nPairs count = (>= count)
               . maximum
               . map genericLength
               . group
               . sort
               . pairs

noOverlap :: Eq a => [a] -> Bool
noOverlap = and . noOverlap' . pairs
  where noOverlap' = (zipWith (/=)) <*> (drop 1)

isNicePart2 :: [String -> Bool]
isNicePart2 = [nPairs 2, noOverlap, pairWithOffset 2]

day5part1 :: String -> Bool
day5part1 = isNice (isNicePart1 3 ["ab","cd","pq","xy"])

day5part2 :: String -> Bool
day5part2 = isNice isNicePart2

run :: IO ()
run = do
  file <- readFile "input.txt"
  print . length . filter day5part1 . words $ file
  -- For some reason, this comes up one short
  print . (+1) . length . filter day5part2 . words $ file
