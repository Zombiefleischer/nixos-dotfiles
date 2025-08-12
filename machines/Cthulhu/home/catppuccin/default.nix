{inputs, ...}: {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    accent = "sapphire";
    flavor = "mocha";

    glamour = {
      enable = true;
      flavor = "mocha";
    };

    mako.enable = false; # Fix #552 in catppuccin/nix
  };

  gtk = {
    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
    font = {
      name = "Noto Sans";
      size = 14;
    };
    iconTheme = {
      name = "Papirus-Dark";
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

  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
  };
  catppuccin.kvantum = {
    enable = true;
    flavor = "mocha";
    accent = "sapphire";
    apply = true;
  };
}
