_: {
  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];

    update.auto = {
      enable = true;
      onCalendar = "10:00";
    };

    overrides = {
      global = {
        Environment = {
          # Fix un-themed cursor in some Wayland apps
          XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";

          # Force correct theme for some GTK apps
          GTK_THEME = "Catppuccin-Mocha-Standard-Sapphire-Dark";
        };

        Context = {
          filesystems = [
            "/home/zombiefleischer/.local/share/fonts:ro"
            "/home/zombiefleischer/.icons:ro"
            "/home/zombiefleischer/.themes:ro"
            "/run/current-system/sw/share/X11/fonts:ro"
          ];
          devices = [
            "dri"
          ];
        };
      };
    };

    packages = [
      "com.github.tchx84.Flatseal"
      "io.github.flattool.Warehouse"
      "xyz.ketok.Speedtest"
      "io.github.zen_browser.zen"
      "me.iepure.devtoolbox"
      "io.dbeaver.DBeaverCommunity"
    ];
  };
}
