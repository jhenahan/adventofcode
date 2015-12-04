{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RecordWildCards   #-}
module Advent.Day3 where

import           BasePrelude hiding (fromList, toList)
import           Data.Set    (fromList, toList)

data Position = Pos { x :: Integer, y :: Integer }
              deriving (Show, Eq, Ord)

move :: Position -> Char -> Position
move Pos{..} = \case
  '^' -> Pos x (y + 1)
  '>' -> Pos (x + 1) y
  'v' -> Pos x (y - 1)
  '<' -> Pos (x - 1) y

totalHouses :: [Position] -> Integer
totalHouses = genericLength . toList . fromList

singleMoves :: Position -> String -> [Position]
singleMoves = scanl' move

pairs :: [a] -> [(a, a)]
pairs = zip <*> tail

flattenPairs :: [(b,b)] -> [b]
flattenPairs = liftA2 (++) (map fst) (map snd)

pairedMoves' :: (Position, Position) -> (Char, Char) -> (Position, Position)
pairedMoves' (p1, p2) (c1, c2) = (move p1 c1, move p2 c2)

pairedMoves :: (Position, Position) -> String -> [(Position, Position)]
pairedMoves initial moves = scanl' pairedMoves' initial realMoves
  where realMoves = map fst dedupedMoves
        dedupedMoves = filter snd $ zip movePairs (cycle [True, False])
        movePairs = pairs moves

day3part1 :: String -> Integer
day3part1 = totalHouses . singleMoves (Pos 0 0)

day3part2 :: String -> Integer
day3part2 = totalHouses . flattenPairs . pairedMoves (Pos 0 0, Pos 0 0)

run :: IO ()
run = do
  file <- readFile "input.txt"
  print $ day3part1 file
  print $ day3part2 file
