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
            meson
            ninja
            gcc
            gnumake

            gtk4
            glib
            gdk-pixbuf
            pango
            xorg.libX11
            gtk4-layer-shell

            pkg-config

            libsysprof-capture
            pcre2
            cairo
            expat
            util-linux
            xorg.libXdmcp
            libxkbcommon
            wayland
            mesa
            libGL
            libselinux
            libsepol
            fribidi
            libthai
            libdatrie
            lerc
          ];

          shellHook = ''
            echo ""
            echo "you have entered c DevShell"
          '';
        };
      }
    );
  };
}
