{
  description = "A collection of project templates by JohanHaas";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs =
    { self, nixpkgs }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      pkgsFor = system: nixpkgs.legacyPackages.${system};

      importAndMapShell =
        shellName: shellPath: forAllSystems (system: (pkgsFor system).callPackage shellPath { });

      allImportedShells = nixpkgs.lib.mapAttrs' importAndMapShell (
        nixpkgs.lib.filter (name: builtins.hasSuffix ".nix" name) (builtins.readDir ./shells)
      );
    in
    {

      templates = {
        shells = {
          description = "initialises shell Flake";
          path = ./template;
        };
      };

      devShells = forAllSystems (system: {

      });
    };
}
