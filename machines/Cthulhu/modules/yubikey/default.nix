{pkgs, ...}: {
  services.udev.packages = [pkgs.yubikey-personalization];

  programs.ssh.startAgent = true;

  security.pam = {
    u2f = {
      enable = true;
      settings.cue = true;
      control = "sufficient";
    };

    services = {
      greetd.u2fAuth = true;
      hyprlock.u2fAuth = true;
    };
  };
}
