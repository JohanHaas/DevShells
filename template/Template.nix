{
  pkgs,
  ...
}:
pkgs.mkShell {
  packages = with pkgs; [
    git
  ];

  #shellHook = ''
  #  echo ""
  #  echo "you've entered the [name] shell"
  #'';
}
