{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Doom requirements
    fd
    ripgrep
    wakatime
  ];

  home.file.".config/doom" = {
    source = ../config/.doom.d;
    recursive = true;
  };

  programs = {
    emacs = {
      enable = true;
      package = pkgs.emacs-nox;
      extraPackages = epkgs: [ epkgs.vterm ];
    };
  };
}
