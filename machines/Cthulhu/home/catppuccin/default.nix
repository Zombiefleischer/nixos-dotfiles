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
}
