{pkgs, ...}: {
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 2;
  boot.initrd.enable = true;
  boot.initrd.systemd.enable = true;
  boot.consoleLogLevel = 3;
  boot.plymouth = {
    enable = true;
    font = "${pkgs.fira-code}/share/fonts/truetype/FiraCode-VF.ttf";
    themePackages = [ pkgs.catppuccin-plymouth ];
    theme = "catppuccin-mocha";
  };
}
