{...}: {
  catppuccin = {
    enable = true;
    accent = "sapphire";
    flavor = "mocha";
  };

  gtk = {
    catppuccin = {
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
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  qt.enable = true;
  qt.style.name = "kvantum";
  qt.platformTheme.name = "kvantum";
  qt.style.catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "sapphire";
    apply = true;
  };
}
