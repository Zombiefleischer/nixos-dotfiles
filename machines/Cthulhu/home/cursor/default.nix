{pkgs, ...}: {
  home.pointerCursor = {
    name = "Posy_Cursor_Black";
    package = pkgs.posy-cursors;
    size = 64;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk.cursorTheme = {
    name = "Posy_Cursor_Black";
    package = pkgs.posy-cursors;
    size = 64;
  };

  home.sessionVariables = {
    HYPRCURSOR_THEME = "Posy_Cursor_Black_HC";
    HYPRCURSOR_SIZE = 64;
    XCURSOR_THEME = "Posy_Cursor_Black";
    XCURSOR_SIZE = 64;
  };
}
