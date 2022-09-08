{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # General
    cmake
    drone-cli

    # Git
    git
    gh
    mr
    tea

    # Nix
    cachix
    niv
    nixfmt
    nixpkgs-fmt
    rnix-lsp
  ];

  home.file.".ghci".text = ''
    :set prompt "λ> "
  '';

  home.sessionPath = [
    "$HOME/.cargo/bin"
    "$HOME/.deno/bin"
    "$HOME/.emacs.d/bin"
    "$HOME/.go/bin"
    "$HOME/.local/bin"
  ];

}
