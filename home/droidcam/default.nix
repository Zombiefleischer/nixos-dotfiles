{
  config,
  pkgs,
  ...
}: let
  v4l2loopback-dc = config.boot.kernelPackages.callPackage ./v4l2loopback-dc.nix {};
in {
  boot.kernelModules = [v4l2loopback-dc];
  home.packages = [
    pkgs.droidcam
    pkgs.android-tools
  ];
}
