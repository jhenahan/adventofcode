{ mkDerivation, base, base-prelude, hspec, optparse-applicative
, QuickCheck, stdenv
}:
mkDerivation {
  pname = "advent";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base base-prelude ];
  executableHaskellDepends = [
    base base-prelude optparse-applicative
  ];
  testHaskellDepends = [ base base-prelude hspec QuickCheck ];
  description = "Advent of Code";
  license = stdenv.lib.licenses.mit;
}
