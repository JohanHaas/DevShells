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
      git
    ];

  shellHook = ''
    echo ""
    echo "you have not replaced the shell"
  '';
}
