{pkgs, ...}: {
  home.packages = with pkgs; [
    ansible
    ansible-doctor
    ansible-language-server
    ansible-later
    ansible-lint
    audacity
    bitwarden
    bitwarden-cli
    codevis
    davinci-resolve
    fastfetch
    filezilla
    # floorp
    gamemode
    gh
    glaxnimate
    hyfetch
    kate
    kile
    krename
    krita
    # kstars
    libreoffice
    lunarvim
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
    scanmem
    (makeAutostartItem {
      name = "signal-desktop";
      package = signal-desktop;
    })
    smartmontools
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
    vivaldi-ffmpeg-codecs
    vlc
    vscodium
    wacomtablet
    zed-editor
    zrok
  ];
}
