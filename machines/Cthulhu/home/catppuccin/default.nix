{
  inputs,
  pkgs,
  ...
}: {
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
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    font = {
      name = "Fira Code Nerd Font";
      pkgs = pkgs.nerd-fonts.fira-code;
      size = 14;
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
