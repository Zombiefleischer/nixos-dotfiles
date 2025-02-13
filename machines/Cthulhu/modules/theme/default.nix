{pkgs, ...}: {
  environment.variables.HYPRCURSOR_THEME = "Posy_Cursor_Black";
  environment.variables.HYPRCURSOR_SIZE = "64";

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "sapphire";
  };

  qt = {
    enable = true;
    style = "kvantum";
    platformTheme = "kde";
  };

  console = {
    earlySetup = true;
    catppuccin = {
      enable = true;
      flavor = "sapphire";
    };
  };

  # Override packages
  nixpkgs.config.packageOverrides = pkgs: {
    catppuccin-papirus-folders = pkgs.catppuccin-papirus-folders.override {
      flavor = "mocha";
      accent = "sapphire";
    };
  };

  environment.systemPackages = with pkgs; [
    catppuccin-papirus-folders
  ];
}
