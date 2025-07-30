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
      zsh
    ];

  shell = "${pkgs.zsh}/bin/zsh";

  shellHook = ''
    echo "\nyou've entered the Cppbar shell"
  '';
}
