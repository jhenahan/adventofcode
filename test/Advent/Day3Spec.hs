{-# LANGUAGE NoImplicitPrelude #-}
module Advent.Day3Spec (main, spec) where

import           Advent.Day3
import           BasePrelude
import           Test.Hspec

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "day3Part1" $ do
    it "count the houses according to directions" $ do
      day3part1 ">" `shouldBe` 2
      day3part1 "^>v<" `shouldBe` 4
      day3part1 "^v^v^v^v^v" `shouldBe` 2
  describe "day3Part2" $ do
    it "Santa and Robo-Santa part ways" $ do
      day3part2 "^v" `shouldBe` 3
      day3part2 "^>v<" `shouldBe` 3
      day3part2 "^v^v^v^v^v" `shouldBe` 11

