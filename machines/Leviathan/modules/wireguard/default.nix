_: {
  networking.wg-quick.interfaces.wg0 = {
    configFile = "/home/zombiefleischer/Documents/PdH/wg0.conf";
    autostart = false;
  };

  networking.networkmanager.dns = "systemd-resolved";
  services.resolved = {
    enable = true;
    fallbackDns = [
      "192.168.178.34"
    ];
    dnssec = "allow-downgrade";
    dnsovertls = "opportunistic";
  };
}
