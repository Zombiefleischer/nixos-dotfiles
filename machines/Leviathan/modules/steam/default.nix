{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.mangohud
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  # Needed for some Steam Games
  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
  };
}
