{config, ...}: {
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.kernelModules = ["v4l2loopback"];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=63 card_label="OBS Cam" exclusive_caps=1
  '';
  security.polkit.enable = true;
}
