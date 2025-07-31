{
  description = "A collection of project templates by JohanHaas";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
    }:
    let
      baseShell = import ./template/Template.nix;

      supportedSystems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      pkgsFor = system: nixpkgs.legacyPackages.${system};

      importShellForSystem =
        system: shellPath:
        (pkgsFor system).callPackage shellPath {
          inherit inputs;
        };

      rawShellFiles = builtins.readDir ./shells;

      allImportedShells = nixpkgs.lib.listToAttrs (
        map (
          fileName:
          let
            shellPath = ./shells + "/${fileName}";
            shellName = nixpkgs.lib.removeSuffix ".nix" fileName;
          in
          {
            name = shellName;
            value = forAllSystems (system: importShellForSystem system shellPath);
          }
        ) (builtins.attrNames rawShellFiles)
      );
    in
    {

      templates = {
        default = {
          description = "initialises shell Flake";
          path = ./template;
        };
      };

      devShells = forAllSystems (
        system: (nixpkgs.lib.mapAttrs (name: shellAttrs: shellAttrs.${system}) allImportedShells)
      );
    };
}
