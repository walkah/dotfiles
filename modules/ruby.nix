{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ ruby_2_7 solargraph ];

  programs.zsh.oh-my-zsh.plugins = [ "bundler" "rails" ];
}
