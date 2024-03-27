{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.mangohud
    pkgs.gamescope
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
