{ mkDerivation, base, stdenv }:
mkDerivation {
  pname = "base-prelude";
  version = "0.1.19";
  sha256 = "00mk7zpm3yb804h0gngvpjxhb2a6nds8qb8mwpn80s20x72083wb";
  libraryHaskellDepends = [ base ];
  homepage = "https://github.com/nikita-volkov/base-prelude";
  description = "The most complete prelude formed from only the \"base\" package";
  license = stdenv.lib.licenses.mit;
}
