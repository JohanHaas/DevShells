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
    {
      templates =
        let
          shellDirs = builtins.readDir ./shells;
          shellNames = builtins.attrNames shellDirs;
        in
        builtins.listToAttrs (
          map (name: {
            name = name;
            value = {
              path = ./shells/${name};
              description = "Devshell for ${name}";
            };
          }) shellNames
        );
    };
}
