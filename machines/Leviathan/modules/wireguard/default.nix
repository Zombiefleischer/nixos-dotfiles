_: {
  networking.wg-quick.interfaces.wg0.configFile = "/home/zombiefleischer/Documents/PdH/wg0.conf";

  networking.networkmanager.dns = "systemd-resolved";
  services.resolved.enable = true;
}
