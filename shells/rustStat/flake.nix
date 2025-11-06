{
  description = "devshell for rustStat";

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

    system = "x86_64-linux";

    pkgs = import nixpkgs {inherit system;};
    pkgsUnstable = import nixpkgs-unstable {inherit system;};

    rustPackages = with pkgsUnstable; [
      rustc
      cargo
      rustfmt
      rust-analyzer
      clippy
      openssl
      pkg-config
      clang
      gtk4-layer-shell

      nodejs
      yarn

      gtk4
      libayatana-appindicator
      dbus
    ];
  in {
    devShells = forAllSystems (
      system: let
      in {
        default = pkgs.mkShell {
          buildInputs = rustPackages;

          shellHook = ''
            echo ""
            echo "you have entered rustStat DevShell"
          '';

          nativeBuildInputs = [pkgs.pkg-config];

          env.RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
        };
      }
    );
  };
}
