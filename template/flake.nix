{
  description = "a devShell getter Template";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    MyDevShells = {
      url = "github:JohanHaas/DevShells";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      MyDevShells,
    }:
    let
      SupportedSystems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs SupportedSystems;
    in
    {
      devShells = forAllSystems (system: {
        default = MyDevShells.devShells.${system}.replaceMe; # replaceMe
      });
    };
}
