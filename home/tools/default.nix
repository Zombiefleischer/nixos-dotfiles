{pkgs, ...}: {
  home.packages = with pkgs; [
    ansible
    ansible-doctor
    ansible-language-server
    # ansible-later
    ansible-lint
    audacity
    bitwarden
    bitwarden-cli
    codevis
    davinci-resolve
    fastfetch
    filezilla
    floorp
    gamemode
    gh
    gimp-with-plugins
    glaxnimate
    hyfetch
    inkscape-with-extensions
    input-leap
    kate
    kile
    krename
    krita
    krita-plugin-gmic
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
    owofetch
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
    usbutils
    uwuify
    vesktop
    via
    vial
    vivaldi
    vivaldi-ffmpeg-codecs
    vlc
    vscodium
    wacomtablet
    wineWowPackages.full
    winetricks
    zed-editor
    zrok
  ];
}
