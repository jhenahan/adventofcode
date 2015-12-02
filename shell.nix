{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, base, base-prelude, hspec, QuickCheck, stdenv
      }:
      mkDerivation {
        pname = "advent";
        version = "0.1.0.0";
        src = ./.;
        libraryHaskellDepends = [ base base-prelude ];
        testHaskellDepends = [ base base-prelude hspec QuickCheck ];
        description = "Advent of Code";
        license = stdenv.lib.licenses.mit;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage f {};

in

  if pkgs.lib.inNixShell then drv.env else drv
