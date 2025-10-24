{
  description = "devshell for template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
  }: let
    supportedSystems = [
      "x86_64-linux"
      "aarch64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
  in {
    devShells = forAllSystems (
      system: let
        pkgs = import nixpkgs {inherit system;};
        pkgsUnstable = import nixpkgs-unstable {inherit system;};
      in {
        default = pkgs.mkShell {
          packages = with pkgs; [
            gcc
            gnumake
            pkg-config
            clang
          ];

          shellHook = ''
            echo ""
            echo "you have entered template DevShell"
          '';
        };
      }
    );
  };
}
