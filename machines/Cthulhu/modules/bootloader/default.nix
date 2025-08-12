{pkgs, ...}: {
  # Bootloader
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
      timeout = 2;
    };
    initrd = {
      enable = true;
      systemd.enable = true;
    };
    consoleLogLevel = 3;
    plymouth = {
      enable = true;
      font = "${pkgs.fira-code}/share/fonts/truetype/FiraCode-VF.ttf";
      theme = "catppuccin-mocha";
    };
  };
  catppuccin = {
    plymouth = {
      enable = true;
      flavor = "mocha";
    };
    tty = {
      enable = true;
      flavor = "mocha";
    };
  };
}
