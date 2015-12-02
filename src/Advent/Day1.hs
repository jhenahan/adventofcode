{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE LambdaCase #-}
module Advent.Day1 where

import BasePrelude

day1Helper :: Integer -> Char -> Integer
day1Helper acc = \case
  ')' -> subtract 1 acc
  '(' -> acc + 1
  _ -> acc

day1Part1 :: String -> Integer
day1Part1 = foldl' day1Helper 0

day1Part2 :: Integer -> String -> Integer
day1Part2 targetFloor = genericLength . takeWhile (/= targetFloor) . scanl' day1Helper 0
