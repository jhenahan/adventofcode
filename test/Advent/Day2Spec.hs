{-# LANGUAGE NoImplicitPrelude #-}
module Advent.Day2Spec (main, spec) where

import           Advent.Day2
import           BasePrelude
import           Test.Hspec

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "day2Part1" $ do
    it "calculates the correct total wrapping paper" $ do
      day2part1 "2x3x4" `shouldBe` 58
      day2part1 "1x1x10" `shouldBe` 43
  describe "day2Part2" $ do
    it "calculates the correct total ribbon" $ do
      day2part2 "2x3x4" `shouldBe` 34
      day2part2 "1x1x10" `shouldBe` 14
