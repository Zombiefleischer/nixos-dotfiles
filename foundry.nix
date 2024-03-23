{
  inputs,
  pkgs,
  ...
}: {
  services.foundryvtt = {
    enable = true;
    hostName = "zombiefleischer.ddns.net";
    proxySSL = true;
    proxyPort = 443;
    dataDir = "/home/zombiefleischer/.local/share/Foundry_V11_plut";
    package = pkgs.foundryvtt.packages.x86_64-linux.foundryvtt_11.overrideAttrs {
      version = "11.0.0+315";
    };
  };
  services.caddy = {
    enable = true;

    virtualHosts."foundry.zombiefleischer.ddns.net".extraConfig = ''
      reverse_proxy localhost:30000
    '';
  };
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [80 443];
  };
}
