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
          rm -R $out/lib/firefox
          rm -R $out/lib/mozilla
        '';
    }))
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
    kittysay
    krename
    krita
    krita-plugin-gmic
    kstars
    libreoffice
    lunarvim
    lutris
    masterpdfeditor
    mc
    ncdu
    nextcloud-client
    nh
    nvd
    obsidian
    oh-my-zsh
    okteta
    owofetch
    pipes
    pipes-rs
    plasma-browser-integration
    powertop
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
    (
      vivaldi.overrideAttrs (oldAttrs: {
        dontWrapQtApps = false;
        dontPatchELF = true;
        nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [pkgs.kdePackages.wrapQtAppsHook];
      })
    )
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
}
