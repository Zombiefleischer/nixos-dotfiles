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
    # ./flatpak
    ./helix
    ./lsps
  ];
}
