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
    cava
    cbonsai
    codevis
    davinci-resolve
    fastfetch
    filezilla
    floorp
    gamemode
    gh
    gimp-with-plugins
    glaxnimate
    gomatrix
    hyfetch
    inkscape-with-extensions
    input-leap
    kate
    kile
    # kitty
    kittysay
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
    pipes
    pipes-rs
    plasma-browser-integration
    protonmail-bridge
    protonup-qt
    qmk
    rar
    ripgrep
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
    yazi
    zed-editor
    zrok
  ];

  cus_vivaldi = pkgs.vivaldi.overrideAttrs (oldAttrs: {
    dontWrapQtApps = false;
    dontPatchELF = true;
    nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [pkgs.kdePackages.wrapQtAppsHook];
  });
}
