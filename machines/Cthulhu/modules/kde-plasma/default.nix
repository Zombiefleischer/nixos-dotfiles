{pkgs, ...}: {
  services.xserver.enable = true;
  programs.xwayland.enable = true;

  services.displayManager.sddm.enable = false;
  services.desktopManager.plasma6.enable = false;
}
