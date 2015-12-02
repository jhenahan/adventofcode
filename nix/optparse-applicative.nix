{ mkDerivation, ansi-wl-pprint, base, process, stdenv, transformers
, transformers-compat
}:
mkDerivation {
  pname = "optparse-applicative";
  version = "0.12.0.0";
  sha256 = "08r1pbywd64kixqn2z1z41q3mprmr7qiqpmrd720rwqhb9sbzma9";
  libraryHaskellDepends = [
    ansi-wl-pprint base process transformers transformers-compat
  ];
  homepage = "https://github.com/pcapriotti/optparse-applicative";
  description = "Utilities and combinators for parsing command line options";
  license = stdenv.lib.licenses.bsd3;
}
