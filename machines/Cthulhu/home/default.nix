{
  inputs,
  system,
  pkgs,
  ...
}: {
  home.stateVersion = "24.11";

  nixpkgs = {
    config.allowUnfree = true;
    config.allowUnfreePredicate = _: true;
  };

  # *.nix file can be omitted if the name is default.nix
  imports = [
    ./avizo
    ./aws
    ./bat
    ./btop
    ./catppuccin
    ./cursor
    ./dir
    ./dunst
    ./firefox
    ./fzf
    ./ghostty
    ./git
    ./go
    ./hypridle
    ./hyprland
    ./hyprlock
    ./kitty
    ./lazygit
    ./lsps
    ./neovim
    ./pyprland
    ./rofi
    ./tealdeer
    ./tools
    ./wallpaper
    ./waybar
    ./wlogout
    ./zsh
  ];

  xdg.enable = true;
}
