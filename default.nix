{ mkDerivation, base, base-prelude, hspec, QuickCheck, stdenv }:
mkDerivation {
  pname = "advent";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [ base base-prelude ];
  testHaskellDepends = [ base base-prelude hspec QuickCheck ];
  description = "Advent of Code";
  license = stdenv.lib.licenses.mit;
}
