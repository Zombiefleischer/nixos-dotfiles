{pkgs, ...}: {
  home.packages = with pkgs; [
    bitwarden
    bitwarden-cli
    floorp
    gamemode
    gh
    kate
    krita
    lutris
    masterpdfeditor
    nextcloud-client
    obsidian
    oh-my-zsh
    plasma-browser-integration
    protonmail-bridge
    protonup-qt
    ranger
    (makeAutostartItem {
      name = "signal-desktop";
      package = signal-desktop;
    })
    steamtinkerlaunch
    telegram-desktop
    thunderbird
    tidal-hifi
    vesktop
    vivaldi
    wacomtablet
  ];
}
