{ config, lib, pkgs, ... }:

{
  home.sessionPath = [ "$HOME/.cargo/bin" ];
  home.packages = with pkgs; [ cargo rustc rust-analyzer ];
}
