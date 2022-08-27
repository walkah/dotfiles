{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # General
    btop
    cmake
    drone-cli
    tea

    # Git
    git
    gh
    mr

    # Elixir
    elixir

    # Golang
    go
    gomodifytags
    gotests
    gore

    # Haskell
    haskellPackages.haskell-language-server
    # haskellPackages.cabal
    haskellPackages.hoogle
    stack

    # Javascript/Typescript
    # deno
    jq
    nodejs
    yarn

    # Nix
    cachix
    niv
    nixfmt
    nixpkgs-fmt
    rnix-lsp

    # Python
    black
    isort
    pipenv
    python39
    python39Packages.pyflakes
    python39Packages.nose
    python39Packages.pytest

    # Rust
    rustup
    rust-analyzer

    # Shell
    shfmt
    shellcheck

    # Web
    nodePackages.stylelint
    nodePackages.js-beautify
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
