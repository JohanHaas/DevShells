{
  pkgs,
  pkgsUnstable,
  ...
}:
pkgs.mkShell {
  packages =
    with pkgsUnstable;
    [
      # --- Rust Toolchain ---
      rustc
      cargo
      rustfmt # Optional, aber nützlich
      clippy # Optional, aber nützlich

      # --- System-Bibliotheken für GTK/Wayland (C-Dependencies) ---
      pkg-config # Zum Finden der C-Bibliotheken
      gtk4 # Die GTK4 C-Bibliothek und Header
      libadwaita # Optional, falls du Adwaita-Widgets nutzt
      wayland # Die Wayland C-Bibliotheken (Client, Cursor, EGL etc.)

      wlroots # (Optional, falls du wlr-protokolle direkt nutzt, für gtk-rs oft nicht direkt nötig)

      # --- Weitere Tools für die Entwicklungsumgebung ---
      cmake # Kann für manche C-Bindings noch nützlich sein, oft aber nicht direkt von Cargo benötigt
      ninja # dito
      clang-tools # Für rust-analyzer (LSP), sehr wichtig für Autovervollständigung etc.
    ]
    ++ [

    ];

  shellHook = ''
    echo ""
    echo "you have entered the rustBar shell"
    echo ""
  '';
}
