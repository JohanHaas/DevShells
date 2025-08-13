{
  description = "devshell for BinTile";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
    }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          pkgsUnstable = nixpkgs-unstable.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {

            packages = with pkgsUnstable; [
              cargo
              rustc
              rustfmt
              clippy
              rust-analyzer

              pkg-config
              wayland
              wlroots
              libxcb
              libxkbcommon
              libinput
              cmake
              ninja
              mesa
            ];
            env.RUST_SRC_PATH = "${pkgsUnstable.rust.packages.stable}";

            shellHook = ''
              echo ""
              echo "you have entered BinTile DevShell"
            '';
          };
        }
      );
    };
}
