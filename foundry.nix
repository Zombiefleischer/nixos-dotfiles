{inputs, ...}: {
  imports = [inputs.foundryvtt.nixosModules.foundryvtt];
  services.foundryvtt = {
    enable = true;
    hostName = "zombiefleischer.ddns.net";
    dataDir = "/home/zombiefleischer/.local/share/Foundry_V11_plut";
    package = foundryvtt.packages.x86_64-linux.foundryvtt_11.overrideAttrs {
      version = "11.0.0+315";
    };
  };
}
