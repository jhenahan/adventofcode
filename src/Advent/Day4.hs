{-# LANGUAGE NoImplicitPrelude #-}
module Advent.Day4 where

import           BasePrelude
import           Data.Hash.MD5

day4Helper key zeroes = length . takeWhile hashTooBig $ [0..]
  where hashTooBig = (> 16^(32 - zeroes)) . md5i . Str . (key++) . show

day4Part1 :: Int
day4Part1 = day4Helper "bgvyzdsv" 5

day4Part2 :: Int
day4Part2 = day4Helper "bgvyzdsv" 6

run :: IO ()
run = do print day4Part1
         print day4Part2
