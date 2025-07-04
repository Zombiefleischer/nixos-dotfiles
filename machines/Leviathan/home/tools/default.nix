{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    appimage-run
    audacity
    bat
    # bitwarden-cli
    bitwarden-desktop
    btop
    # FIXME: calibre
    # (calibre.overrideAttrs (old: {
    #   postInstall = ''
    #     wrapProgram $out/bin/calibre \
    #         --set-default ACSM_LIBCRYPTO ${pkgs.openssl.out}/lib/libcrypto.so \
    #         --set-default ACSM_LIBSSL ${pkgs.openssl.out}/lib/libssl.so
    #   '';
    # }))
    # (calibre.override {
    # unrarSupport = true;
    # })
    catppuccin
    catppuccin-kvantum
    catppuccin-papirus-folders
    # cava
    cbonsai
    clinfo
    codevis
    corefonts
    # davinci-resolve
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
    gamemode
    gh
    # gimp-with-plugins
    git
    glaxnimate
    glxinfo
    gnupg1
    gomatrix
    gparted
    gpu-viewer
    grayjay
    guvcview
    hyfetch
    imagemagick
    inetutils
    inkscape-with-extensions
    # input-leap
    jq
    jstest-gtk
    junction
    keymapp
    kile
    kittysay
    krename
    krita
    krita-plugin-gmic
    # kstars
    lazydocker
    libportal
    # libreoffice
    librewolf
    libva
    lm_sensors
    lmstudio
    lsof
    lunarvim
    lutris
    masterpdfeditor
    mc
    # mission-center
    (mommy.override {
      mommySettings = {
        sweetie = "little darling";
      };
    })
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
    onlyoffice-desktopeditors
    overlayed
    oversteer
    owofetch
    pavucontrol
    pinentry
    pipes
    pipes-rs
    playerctl
    powertop
    protonmail-bridge
    protonup-qt
    protonvpn-cli
    protonvpn-gui
    qmk
    qpwgraph
    r2modman
    rar
    reaper
    resources
    revolt-desktop
    ripgrep
    rsibreak
    sc-im
    scanmem
    showmethekey
    signal-cli
    signal-desktop-bin
    smartmontools
    starfetch
    steamtinkerlaunch
    telegram-desktop
    thunderbird
    tidal-hifi
    tldr
    unar
    ungoogled-chromium
    universal-android-debloater
    unzip
    usbtop
    usbutils
    uwuify
    v4l-utils
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
    vulkan-hdr-layer-kwin6
    wayland
    wayland-utils
    wget
    wineWowPackages.full
    winetricks
    wireguard-tools
    wl-clipboard
    yazi
    zed-editor
    zoxide
    zrok
    zsa-udev-rules
  ];
}
