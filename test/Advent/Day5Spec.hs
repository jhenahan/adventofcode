{-# LANGUAGE NoImplicitPrelude #-}
module Advent.Day5Spec (main, spec) where

import           Advent.Day5
import           BasePrelude
import           Test.Hspec

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "day5Part1" $ do
    it "nice strings are nice" $ do
      day5part1 "ugknbfddgicrmopn" `shouldBe` True
      day5part1 "aaa" `shouldBe` True
    it "naughty strings are naughty" $ do
      day5part1 "jchzalrnumimnmhp" `shouldBe` False
      day5part1 "haegwjzuvuyypxyu" `shouldBe` False
      day5part1 "dvszwmarrgswjxmb" `shouldBe` False
  describe "day5Part2" $ do
    it "nice strings are nice" $ do
      day5part2 "qjhvhtzxzqqjkmpb" `shouldBe` True
      day5part2 "xxyxx" `shouldBe` True
    it "naughty strings are naughty" $ do
      day5part2 "uurcxstgmygtbstg" `shouldBe` False
      day5part2 "ieodomkazucvgmuy" `shouldBe` False
