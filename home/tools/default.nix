{pkgs, ...}: {
  home.packages = [
    pkgs.gamemode
    pkgs.krita
    pkgs.kdePackages.qtstyleplugin-kvantum
    pkgs.ranger
    pkgs.wacomtablet
  ];
}
