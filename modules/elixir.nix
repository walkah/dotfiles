{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ elixir elixir_ls ];

  programs.zsh.oh-my-zsh.plugins = [ "mix" ];
}
