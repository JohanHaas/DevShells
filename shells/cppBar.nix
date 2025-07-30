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
      gtkmm3
      wayland
      wlroots

    ]
    ++ [
      git
    ];

  shellHook = ''
    echo ""
    echo "you've entered the Cppbar shell"
  '';
}
