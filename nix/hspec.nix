{ mkDerivation, base, directory, hspec-core, hspec-discover
, hspec-expectations, hspec-meta, HUnit, QuickCheck, stdenv
, stringbuilder, transformers
}:
mkDerivation {
  pname = "hspec";
  version = "2.2.1";
  sha256 = "0ypi7544dq9392ywc2ymw0k7a5av8p4if4lzhbqs10n1h68xyzy2";
  libraryHaskellDepends = [
    base hspec-core hspec-discover hspec-expectations HUnit QuickCheck
    transformers
  ];
  testHaskellDepends = [
    base directory hspec-core hspec-meta stringbuilder
  ];
  homepage = "http://hspec.github.io/";
  description = "A Testing Framework for Haskell";
  license = stdenv.lib.licenses.mit;
}
