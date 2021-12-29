{
  description = "walkah's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }: {
    homeConfigurations = {
      aarch64-darwin = home-manager.lib.homeManagerConfiguration {
        system = "aarch64-darwin";
        homeDirectory = "/Users/walkah";
        username = "walkah";
        stateVersion = "21.03";
        configuration = { config, pkgs, ... }: {
          imports = [
            ./home.nix
          ];
        };
      };
      x86_64-darwin = home-manager.lib.homeManagerConfiguration {
        system = "x86_64-darwin";
        homeDirectory = "/Users/walkah";
        username = "walkah";
        stateVersion = "21.03";
        configuration = { config, pkgs, ... }: {
          imports = [
            ./home.nix
          ];
        };
      };
      x86_64-linux = home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = "/home/walkah";
        username = "walkah";
        stateVersion = "21.03";
        configuration = { config, pkgs, ... }: {
          imports = [
            ./home.nix
          ];
        };
      };

    };
    defaultPackage.aarch64-darwin = self.homeConfigurations.aarch64-darwin.activationPackage;
    defaultPackage.x86_64-darwin = self.homeConfigurations.x86_64-darwin.activationPackage;
    defaultPackage.x86_64-linux = self.homeConfigurations.x86_64-linux.activationPackage;
  };
}
