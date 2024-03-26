{config, ...}: let
  v4l2loopback-dc = config.boot.kernelPackages.callPackage ../../drv/v4l2loopback-dc.nix {};
in {
  boot = {
    kernelModules = ["v4l2loopback-dc"];
    extraModulePackages = [v4l2loopback-dc];
    extraModprobeConfig = ''
      options v4l2loopback-dc width=1920 height=1080
    '';
  };
}
