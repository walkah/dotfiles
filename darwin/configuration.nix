{ config, pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ./homebrew.nix ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    deno
    elixir
    emacs
    exercism
    go
    niv
    nodejs
    rustup
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nix.distributedBuilds = true;
  nix.buildMachines = [{
    hostName = "plato";
    systems = [ "x86_64-linux" "aarch64-linux" ];
    maxJobs = 12;
    speedFactor = 2;
    supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
  }];

  # Binary Cache for Haskell.nix
  nix.binaryCachePublicKeys =
    [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" ];
  nix.binaryCaches = [ "https://hydra.iohk.io" ];

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs = {
    zsh = {
      enable = true;
      promptInit = "";
    };
  };
  # programs.fish.enable = true;

  users.nix.configureBuildUsers = true;
  users.users.walkah = {
    home = "/Users/walkah";
    shell = pkgs.zsh;
  };
  home-manager.users.walkah = import ../home.nix;

  services.lorri.enable = true;

  system = {
    defaults = {
      dock = {
        autohide = true;
        orientation = "left";
      };
    };
  };

  system.activationScripts.applications.text = pkgs.lib.mkForce (
    ''
      rm -rf /Applications/Nix
      mkdir -p /Applications/Nix
      for app in $(find ${config.system.build.applications}/Applications -maxdepth 1 -type l); do
        src="$(/usr/bin/stat -f%Y "$app")"
        cp -r "$src" /Applications/Nix
      done
    ''
  );

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
