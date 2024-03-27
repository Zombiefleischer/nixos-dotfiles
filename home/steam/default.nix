{pkgs, ...}: {
  home.packages = [
    pkgs.mangohud
    pkgs.gamescope
  ];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
