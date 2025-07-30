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
      # preinstalled

    ];

  shell = "${pkgs.zsh}/bin/zsh";

  shellHook = ''
    echo ""
    echo "you've entered the Cppbar shell"
  '';
}
