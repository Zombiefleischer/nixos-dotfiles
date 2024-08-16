{pkgs, ...}: {
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd";
  };
  boot.kernelModules = ["i2c-dev" "i2c-piix4"];
}
