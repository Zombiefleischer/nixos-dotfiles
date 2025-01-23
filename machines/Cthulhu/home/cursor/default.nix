{pkgs,...}:{
  home.pointerCursor = {
    name = "Posy_Cursor_Black";
    package = pkgs.posy-cursors;
    size = 64;
    gtk.enable = true;
    x11.enable = true;
  };
}
