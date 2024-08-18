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
  home.stateVersion = "24.11";

  nixpkgs = {
    overlays = overlays;
    config.allowUnfree = true;
    config.allowUnfreePredicate = _: true;
  };

  # *.nix file can be omitted if the name is default.nix
  imports = [
    ./aws
    ./firefox
    ./git
    ./go
    ./kitty
    ./lazygit
    ./lsps
    ./tools
  ];

  xdg.enable = true;
}
