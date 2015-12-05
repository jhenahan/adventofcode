{-# LANGUAGE NoImplicitPrelude #-}
module Advent.Day5 where

import           BasePrelude


atLeastNVowels :: Integer -> String -> Bool
atLeastNVowels n = (>= n) . genericLength . filter (`elem` "aeiou")

atLeastNRun :: Integer -> String -> Bool
atLeastNRun n = (>= n) . maximum . map genericLength . group

containsForbidden :: [String] -> String -> Bool
containsForbidden = flip (any . flip isInfixOf)

isNice :: [String -> Bool] -> String -> Bool
isNice rules = and . sequence rules

isNicePart1 :: Integer -> Integer -> [String] -> [String -> Bool]
isNicePart1 vowels run forbidden =  [atLeastNVowels vowels
                                    , atLeastNRun run
                                    , not . containsForbidden forbidden]

day5part1 :: String -> Bool
day5part1 = isNice  (isNicePart1 3 2 ["ab","cd","pq","xy"])

run :: IO ()
run = do
  file <- readFile "input.txt"
  print . length . filter (==True) . map day5part1 . words $ file
