{
  description = "walkah's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, ... }:
    flake-utils.lib.eachSystem [ "x86_64-linux" "x86_64-darwin" "aarch64-darwin" ]
      (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          homeConfigurations = {
            walkah = home-manager.lib.homeManagerConfiguration {
              system = system;
              homeDirectory = if pkgs.stdenv.isDarwin then "/Users/walkah" else "/home/walkah";
              username = "walkah";
              stateVersion = "21.03";
              configuration = { config, pkgs, ... }: {
                imports = [ ./home.nix ];
              };
            };
          };
          packages.default =
            self.homeConfigurations.${system}.walkah.activationPackage;
        });
}
