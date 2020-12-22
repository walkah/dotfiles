{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    ghc
    stack
    stylish-haskell
    haskellPackages.ghcide
    haskellPackages.hoogle
  ];
}
