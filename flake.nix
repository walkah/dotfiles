{
  description = "walkah's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, flake-utils, pre-commit-hooks, ... }:
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

          checks = {
            pre-commit-check = pre-commit-hooks.lib.${system}.run {
              src = ./.;
              hooks = {
                deadnix.enable = true;
                nixpkgs-fmt.enable = true;
                statix.enable = true;
              };
            };
          };


          devShells.default = pkgs.mkShell {
            name = "dotfiles";
            buildInputs = with pkgs; [
              deadnix
              nil
              nixpkgs-fmt
              statix
            ];

            inherit (self.checks.${system}.pre-commit-check) shellHook;
          };
        });
}
