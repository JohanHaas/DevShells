#CppBar shell
{
  pkgs,
  ...
}:
pkgs.mkShell {
  packages = with pkgs; [
    gcc
    cmake
    ninja
    gtkmm4
    gtkmm3
    wayland
    wlroots
  ];
  shellHook = ''
    echo "you've entered the Cppbar shell"
  '';
}
