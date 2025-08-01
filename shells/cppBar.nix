#CppBar shell
{
  pkgs,
  pkgsStable,
  ...
}:
pkgs.mkShell {
  packages =
    with pkgsStable;
    [
      gcc
      cmake
      ninja
      gtkmm4
      pkg-config
      wayland
      wlroots
      libnl
      pipewire
      upower
      spdlog
      clang-tools
      kdePackages.wayland-protocols
      pcre2
      util-linux
      libselinux
      libsepol
      fribidi
      libthai
      libdatrie
      expat
      xorg.libXdmcp
    ]
    ++ [
      git
    ];

  shellHook = ''
    echo ""
    echo "you've entered the Cppbar shell"
  '';
}
