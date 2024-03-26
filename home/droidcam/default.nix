{pkgs, ...}: {
  home.packages = [
    pkgs.droidcam
    pkgs.android-tools
  ];

  home.file.".config/droidcam".source = ./droidcam;
}
