{pkgs,...}:{

  services.xserver.enable = true;
  programs.xwayland.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
}
