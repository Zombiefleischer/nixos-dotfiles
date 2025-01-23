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
    ./aws
    ./catppuccin
    ./firefox
    ./ghostty
    ./git
    ./go
    ./kitty
    ./lazygit
    ./lsps
    ./neovim
    ./tools
    ./wallpaper
  ];

  xdg.enable = true;
}
