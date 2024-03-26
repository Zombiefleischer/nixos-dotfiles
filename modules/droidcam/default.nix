{config, ...}: let
  v4l2loopback-dc = config.boot.kernelPackages.callPackage ../../drv/v4l2loopback-dc.nix {};
in {
  boot = {
    kernelModules = ["v4l2loopback-dc"];
    extraModulePackages = [v4l2loopback-dc];
  };
}
