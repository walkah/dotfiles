{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Doom requirements
    fd
    ripgrep
    wakatime
  ];

  home.file.".doom.d" = {
    onChange = ''
      #!/bin/sh
      DOOM=$HOME/.emacs.d
      if [ ! -d $DOOM ]; then
        git clone --depth 1 https://github.com/hlissner/doom-emacs $DOOM
      fi
    '';
    source = ../config/.doom.d;
    recursive = true;
  };

  programs = {
    emacs = {
      enable = true;
      package = pkgs.emacs29-nox;
      extraPackages = epkgs: [ epkgs.vterm ];
    };
  };
}
