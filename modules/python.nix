{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pipenv
    python3
    python38Packages.black
    python38Packages.isort
    python38Packages.pyflakes
    python38Packages.pytest
  ];
}
