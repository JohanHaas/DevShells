{
  pkgs,
  ...
}:
pkgs.mkShell {
  packages =
    with pkgs;
    [

    ]
    ++ [
      #git
    ];

  shellHook = ''
    echo ""
    echo -e "\033[1;31mError:\033[0m you have not updated the shell"
    echo ""
    exit
  '';
}
