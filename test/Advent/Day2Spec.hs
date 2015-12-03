{-# LANGUAGE NoImplicitPrelude #-}
module Advent.Day2Spec (main, spec) where

import Test.Hspec
import Test.QuickCheck
import BasePrelude
import Advent.Day1
import Advent.Day2

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "day2Part1" $ do
    it "equal delimiters cancel out" $ do
      day1Part1 "(())" `shouldBe` 0
      day1Part1 "()()" `shouldBe` 0
    it "equal delimiters QC" $ property $
      let charCount char = genericLength . filter (==char) in
      \x -> charCount '(' x - charCount ')' x == day1Part1 x
    it "excess open parens goes to upper floor" $ do
      day1Part1 "(((" `shouldBe` 3
      day1Part1 "(()(()(" `shouldBe` 3
      day1Part1 "))(((((" `shouldBe` 3
    it "excess close parens goes to basement" $ do
      day1Part1 "())" `shouldBe` negate 1
      day1Part1 "))(" `shouldBe` negate 1
      day1Part1 ")))" `shouldBe` negate 3
      day1Part1 ")())())" `shouldBe` negate 3
  describe "day2Part2" $ do
    it "calculates the correct total wrapping paper" $ do
      day2part1 "2x3x4" `shouldBe` 58
      day2part1 "1x1x10" `shouldBe` 43
    it "calculates the correct total ribbon" $ do
      day2part2 "2x3x4" `shouldBe` 34
      day2part2 "1x1x10" `shouldBe` 14
