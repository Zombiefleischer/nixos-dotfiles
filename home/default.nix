{
  inputs,
  system,
  ...
}: let
  overlays = [
    (final: prev: {
      helix = inputs.helix-master.packages.${system}.default;
    })
  ];
in {
  home.stateVersion = "24.05";

  nixpkgs = {
    overlays = overlays;
    config.allowUnfree = true;
    config.allowUnfreePredicate = _: true;
  };

  # TODO: configure git in another module
  programs.git.enable = true;

  # *.nix file can be omitted if the name is default.nix
  imports = [
    ./droidcam
    ./firefox
    ./floorp
    ./helix
    ./hyprland
    ./i3
    ./kitty
    ./lsps
    ./minecraft
    ./obs
    ./tools

    ./desktop-files/edhm-ui.nix
    # ./desktop-files/veadotube.nix
  ];

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
