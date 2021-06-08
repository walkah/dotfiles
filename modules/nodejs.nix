{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs
    nodePackages.js-beautify
    nodePackages.prettier
    yarn
  ];
}
