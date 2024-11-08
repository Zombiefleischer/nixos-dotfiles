{pkgs, ...}: {
  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    # package = pkgs.banana-cursor-dreams;
    package = pkgs.posy-cursors;
    size = 96;
    name = "Posy_Cursor_Black";
    # name = "Banana-Blue";
  };
}
