{pkgs, ...}:{
  home.packages = [
    pkgs.droidcam
    pkgs.android-tools
  ];

  xdg.configFile = {
    "droidcam" = {
      source = ./droidcam;
    };
  };
}
