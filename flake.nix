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
              inherit pkgs;

              modules = [
                ./home.nix
              ];
            };
          };

          packages.homeConfigurations = self.homeConfigurations.${system};
          packages.default =
            self.homeConfigurations.${system}.walkah.activationPackage;

          devShells.default = pkgs.mkShell {
            name = "dotfiles";
            buildInputs = with pkgs; [
              nil
              nixpkgs-fmt
            ];
          };
        });
}
