{pkgs, ...}: {
  home.packages = with pkgs; [
    audacity
    bitwarden
    bitwarden-cli
    codevis
    floorp
    gamemode
    gh
    kate
    kile
    krename
    krita
    # kstars
    libreoffice
    lutris
    masterpdfeditor
    nextcloud-client
    obsidian
    oh-my-zsh
    okteta
    plasma-browser-integration
    protonmail-bridge
    protonup-qt
    ranger
    rar
    rsibreak
    (makeAutostartItem {
      name = "signal-desktop";
      package = signal-desktop;
    })
    steamtinkerlaunch
    telegram-desktop
    thunderbird
    tidal-hifi
    unar
    # vesktop
    vivaldi
    vlc
    wacomtablet
  ];
}
