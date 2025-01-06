{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    appimage-run
    audacity
    bat
    bitwarden-cli
    btop
    catppuccin
    catppuccin-kvantum
    catppuccin-papirus-folders
    # cava
    cbonsai
    clinfo
    codevis
    davinci-resolve
    delta
    dig
    egl-wayland
    eza
    fastfetch
    fd
    ffmpeg-full
    filezilla
    # floorp # Override - see https://github.com/nix-community/home-manager/issues/5132
    (floorp.overrideAttrs (old: {
      name = "floorp-cleaned";
      buildCommand =
        /*
        bash
        */
        ''
          set -euo pipefail
          set -x
          cp -rs --no-preserve=mode "${pkgs.floorp.out}" "$out"
          set +x
          rm -R $out/lib/mozilla
        '';
    }))
    freecad-wayland
    fzf
    gale
    gamemode
    gh
    # gimp-with-plugins
    git
    glaxnimate
    glxinfo
    gnupg1
    gomatrix
    goxlr-utility
    gparted
    gpu-viewer
    hyfetch
    imagemagick
    inetutils
    inkscape-with-extensions
    input-leap
    jq
    junction
    kate
    kdialog
    keymapp
    kile
    kittysay
    krename
    krita
    krita-plugin-gmic
    kstars
    lazydocker
    libportal
    libreoffice
    librewolf
    libva
    lm_sensors
    lsof
    lunarvim
    lutris
    masterpdfeditor
    mc
    # mission-center
    ncdu
    neovim
    nextcloud-client
    nh
    nix-output-monitor
    nvd
    nvidia-system-monitor-qt
    nvidia-texture-tools
    nvidia-vaapi-driver
    obsidian
    oh-my-zsh
    okteta
    onefetch
    overlayed
    owofetch
    partition-manager
    pavucontrol
    pinentry
    pipes
    pipes-rs
    playerctl
    plasma-browser-integration
    powertop
    protonmail-bridge
    protonup-qt
    qmk
    qpwgraph
    r2modman
    rar
    reaper
    resources
    ripgrep
    rsibreak
    scanmem
    showmethekey
    signal-cli
    signal-desktop
    smartmontools
    starfetch
    steamtinkerlaunch
    telegram-desktop
    thunderbird
    tidal-hifi
    tldr
    unar
    universal-android-debloater
    unzip
    usbtop
    usbutils
    uwuify
    vesktop
    via
    vial
    # (
    # vivaldi.overrideAttrs (oldAttrs: {
    # dontWrapQtApps = false;
    # dontPatchELF = true;
    # nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [pkgs.kdePackages.wrapQtAppsHook];
    # })
    # )
    vivaldi-ffmpeg-codecs
    vlc
    vscodium
    wayland
    wayland-utils
    wget
    wineWowPackages.full
    winetricks
    wl-clipboard
    yazi
    zed-editor
    zoxide
    zrok
    zsa-udev-rules
  ];
}
