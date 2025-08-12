{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/desktop/a11y/applications" = {
      screen-reader-enabled = false;
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-size = 64;
      cursor-theme = "Posy_Cursor_Black";
      enable-animations = true;
      font-name = "Noto Sans,  10";
      icon-theme = "Papirus-Dark";
      scaling-factor = mkUint32 1;
      text-scaling-factor = 1.0;
      toolbar-style = "text";
    };

    "org/gnome/desktop/sound" = {
      theme-name = "ocean";
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "icon:minimize,maximize,close";
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = true;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 152;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [0 0];
      window-size = mkTuple [1138 747];
    };
  };
}
