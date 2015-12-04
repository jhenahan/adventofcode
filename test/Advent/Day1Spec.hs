{-# LANGUAGE NoImplicitPrelude #-}
module Advent.Day1Spec (main, spec) where

import           Advent.Day1
import           BasePrelude
import           Test.Hspec
import           Test.QuickCheck

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "day1Part1" $ do
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
  describe "day1Part2" $ do
    it "initial close paren reaches the basement immediately" $ do
      day1Part2 (negate 1) ")" `shouldBe` Just 1
    it "()()) enters the basement at position 5" $ do
      day1Part2 (negate 1) "()())" `shouldBe` Just 5
    it "should return Nothing for strings that don't reach the target floor" $ do
      day1Part2 (negate 1) "(((" `shouldBe` Nothing
      day1Part2 1 ")))" `shouldBe` Nothing
      day1Part2 1 "" `shouldBe` Nothing

