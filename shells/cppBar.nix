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
    ]
    ++ [
      git
    ];

  shellHook = ''
    echo ""
    echo "you've entered the Cppbar shell"
  '';
}
