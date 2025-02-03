{...}: {
  catppuccin = {
    enable = true;
    accent = "sapphire";
    flavor = "mocha";

    glamour = {
      enable = true;
      flavor = "mocha";
    };
  };

  gtk = {
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
  catppuccin.gtk = {
    enable = true;
    accent = "sapphire";
    flavor = "mocha";
    icon = {
      enable = true;
      accent = "sapphire";
      flavor = "mocha";
    };
    size = "standard";
    tweaks = ["black" "rimless"];
  };

  qt.enable = true;
  qt.style.name = "kvantum";
  qt.platformTheme.name = "kvantum";
  catppuccin.kvantum = {
    enable = true;
    flavor = "mocha";
    accent = "sapphire";
    apply = true;
  };
}
