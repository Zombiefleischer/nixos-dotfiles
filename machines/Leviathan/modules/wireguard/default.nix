_: {
  networking.wg-quick.interfaces.wg0 = {
    configFile = "/home/zombiefleischer/Documents/PdH/wg0.conf";
    autostart = false;
  };

  networking.networkmanager.dns = "systemd-resolved";
  services.resolved.enable = true;
}
