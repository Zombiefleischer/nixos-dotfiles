{pkgs, ...}: {
  home.packages = with pkgs; [
    jetbrains-toolbox

    alejandra
    ansible
    # ansible-doctor
    # ansible-navigator
    appimage-run
    at-spi2-atk
    bitwarden
    # bitwarden-cli
    brightnessctl
    btop
    calibre
    catppuccin
    catppuccin-kvantum
    catppuccin-papirus-folders
    clinfo
    cliphist
    cloudlens
    copier
    corefonts
    curlie
    # dbeaver-bin
    dig
    dive
    docker-buildx
    dotacat
    dysk
    eza
    fastfetch
    fd
    feh
    ffmpeg-full
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
    fzf
    gimp
    git
    gitui
    glab
    glxinfo
    gnupg1
    gparted
    graphviz-nox
    greetd.tuigreet
    grim
    guvcview
    helm-docs
    helmfile
    home-manager
    hyfetch
    hyprpicker
    hyprcursor
    hypridle
    imagemagick
    inetutils
    # input-leap
    jira-cli-go
    jq
    keymapp
    kittysay
    krename
    kubectl
    kubectl-graph
    kubectl-neat
    kubectl-tree
    kubectl-klock
    kubectl-ktop
    kubectx
    kubernetes-helm
    lazydocker
    libnotify
    libreoffice-qt6-fresh
    libsecret
    lm_sensors
    lsof
    lunarvim
    ncdu
    # neovim
    nix-output-monitor
    networkmanagerapplet
    nmap
    nmap-formatter
    nss
    nvd
    obsidian
    oh-my-zsh
    opentofu
    overskride
    owofetch
    pamixer
    # picom-pijulius
    playerctl
    posting
    poweralertd
    powertop
    psi-notify
    psmisc
    pyprland
    (python3.withPackages (ps: [ps.ansible ps.dnspython ps.pip ps.requests]))
    pwvucontrol
    # quickemu
    # quickgui
    ripgrep
    rsclock
    scanmem
    slack
    slurp
    smartmontools
    space-cadet-pinball
    speedtest-rs
    spice
    super-productivity
    swappy
    swww
    xfce.thunar
    thunderbird-unwrapped
    unar
    ungoogled-chromium
    unzip
    usbtop
    usbutils
    uwuify
    v4l-utils
    vim
    vlc
    wget
    wl-clipboard
    wl-clip-persist
    wlrctl
    wlr-randr
    wtype
    yazi
    yubikey-manager
    zoxide
    zsa-udev-rules
    zsh
  ];
}
