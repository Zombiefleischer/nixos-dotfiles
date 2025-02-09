{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    ansible
    # ansible-doctor
    # ansible-navigator
    appimage-run
    at-spi2-atk
    bitwarden
    bitwarden-cli
    brightnessctl
    btop
    catppuccin
    catppuccin-kvantum
    catppuccin-papirus-folders
    clinfo
    cliphist
    cloudlens
    copier
    dbeaver-bin
    dig
    docker-buildx
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
    greetd.tuigreet
    grim
    helm-docs
    helmfile
    home-manager
    hyfetch
    hyprpicker
    hyprcursor
    hypridle
    imagemagick
    inetutils
    input-leap
    jira-cli-go
    jq
    kate
    kdialog
    keymapp
    kittysay
    krename
    kubectl
    kubectl-neat
    kubectl-tree
    kubectl-klock
    kubectl-ktop
    kubectx
    kubernetes-helm
    lazydocker
    libnotify
    libreoffice-qt6-fresh
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
    pavucontrol
    # picom-pijulius
    plasma-browser-integration
    playerctl
    poweralertd
    powertop
    psi-notify
    psmisc
    pyprland
    (python3.withPackages (ps: [ps.ansible ps.dnspython ps.pip ps.requests]))
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
    swww
    thunderbird-unwrapped
    unar
    unzip
    usbtop
    usbutils
    uwuify
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
