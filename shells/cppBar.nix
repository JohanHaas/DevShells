#CppBar shell
{
  pkgs,
  ...
}:
pkgs.mkShell {
  packages =
    with pkgs;
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
    ]
    ++ [
      git
      neovim
    ];

  shellHook = ''
    echo ""
    echo "you've entered the Cppbar shell"
  '';
}
