{
  inputs,
  system,
  ...
}: {
  home.stateVersion = "24.11";

  nixpkgs = {
    config.allowUnfree = true;
    config.allowUnfreePredicate = _: true;
  };

  # *.nix file can be omitted if the name is default.nix
  imports = [
    ./calibre
    ./cursor
    ./droidcam
    ./firefox
    ./fonts
    ./ghostty
    ./git
    ./go
    ./hyprland
    ./i3
    ./kdePackages
    ./kitty
    ./lan-mouse
    ./lazygit
    ./lsps
    ./minecraft
    ./mpd
    ../../Cthulhu/home/neovim
    ./obs
    ./tools
    ./zsh

    ./desktop-files/edhm-ui.nix
    # ./desktop-files/veadotube.nix
  ];

  # Activate Bluetooth Media Controls
  services.mpris-proxy.enable = true;

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    QT_QPA_PLATFORM = "wayland";
  };

  # xdg.enable = true;
}
