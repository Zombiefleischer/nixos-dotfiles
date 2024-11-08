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
    ./cursor
    ./droidcam
    ./firefox
    ./git
    ./go
    ./hyprland
    ./i3
    ./kitty
    ./lazygit
    ./lsps
    ./minecraft
    ./obs
    ./tools
    ./zsh

    ./desktop-files/edhm-ui.nix
    # ./desktop-files/veadotube.nix
  ];

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  # xdg.enable = true;
}
