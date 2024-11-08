{pkgs, ...}: {
  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    package = pkgs.banana-cursor;
    size = 96;
    name = "Banana-Blue";
  };
}
