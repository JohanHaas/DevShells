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
    wrl-protocols
  ];
  shellHook = ''
    echo "you entered the Cppbar shell"
  '';
}
