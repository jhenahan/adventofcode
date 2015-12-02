{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE LambdaCase #-}
module Advent.Day1 where

import BasePrelude

day1Helper :: Integer -> Char -> Integer
day1Helper acc = \case
  ')' -> subtract 1 acc
  '(' -> acc + 1
  _ -> acc

genericElemIndex :: (Eq a, Integral i) => a -> [a] -> Maybe i
genericElemIndex x xs =
  listToMaybe $
  map fst $
  filter snd $
  zip [0..] $
  map (== x) xs

day1Part1 :: String -> Integer
day1Part1 = foldl' day1Helper 0

day1Part2 :: Integer -> String -> Maybe Integer
day1Part2 targetFloor = genericElemIndex targetFloor . scanl' day1Helper 0
