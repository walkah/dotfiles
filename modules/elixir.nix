{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ elixir ];

  programs.zsh.oh-my-zsh.plugins = [ "mix" ];
}
