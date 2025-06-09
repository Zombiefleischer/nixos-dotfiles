{config, ...}:
# let
# v4l2loopback-dc = config.boot.kernelPackages.callPackage ../../drv/v4l2loopback-dc.nix {};
# in
{
  boot = {
    kernelModules = [
      # "v4l2loopback-dc"
      "v4l2loopback"
    ];
    extraModulePackages = [
      # v4l2loopback-dc
      config.boot.kernelPackages.v4l2loopback
    ];
    # extraModprobeConfig = ''
    #   options v4l2loopback-dc width=1920 height=1080
    # '';
  };
}
