# dotfiles

This is how I manage my workstations. Currently using [nix](https://nixos.org) (and nix-darwin).

## Install 
    
1. Install nix (daemon mode): `sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume --daemon`
1. Install nix-darwin:
   * `nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer`
   * `./result/bin/darwin-installer`
1. Add home-manager channel:
   * `nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager`
   * `nix-channel --update`
1. Link `./darwin/configuration.nix` to `~/.nixpkgs/darwin-configuration.nix`
1. Run `darwin-rebuild switch`
