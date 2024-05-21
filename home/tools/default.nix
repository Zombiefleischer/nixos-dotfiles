{pkgs, ...}: {
  home.packages = with pkgs; [
    audacity
    bitwarden
    bitwarden-cli
    codevis
    fastfetch
    filezilla
    floorp
    gamemode
    gh
    hyfetch
    kate
    kile
    krename
    krita
    # kstars
    libreoffice
    lutris
    masterpdfeditor
    mc
    ncdu
    nextcloud-client
    obsidian
    oh-my-zsh
    okteta
    plasma-browser-integration
    protonmail-bridge
    protonup-qt
    qmk
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
    uwuify
    vesktop
    via
    vial
    vivaldi
    vlc
    wacomtablet
    zrok
  ];
}
