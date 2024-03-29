{pkgs, ...}: {
  home.packages = with pkgs; [
    bitwarden
    bitwarden-cli
    floorp
    gamemode
    kate
    krita
    nextcloud-client
    obsidian
    oh-my-zsh
    plasma-browser-integration
    protonmail-bridge
    ranger
    signal-desktop
    telegram-desktop
    thunderbird
    tidal-hifi
    (makeAutostartItem {
      name = "vesktop";
      package = vesktop;
    })
    vivaldi
    wacomtablet
  ];
}
