{pkgs, ...}: {
  services.udev.packages = [pkgs.vial];
}
