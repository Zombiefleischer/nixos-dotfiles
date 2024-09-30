{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    ansible
    ansible-doctor
    # ansible-navigator
    appimage-run
    barrier
    bat
    bitwarden
    bitwarden-cli
    btop
    catppuccin
    catppuccin-kvantum
    catppuccin-papirus-folders
    clinfo
    copier
    # dbeaver-bin
    delta
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
          rm -R $out/lib/firefox
          rm -R $out/lib/mozilla
        '';
    }))
    fzf
    gimp
    git
    gitui
    gh
    glab
    glxinfo
    gnupg1
    gparted
    helm-docs
    helmfile
    home-manager
    hyfetch
    imagemagick
    input-leap
    jira-cli-go
    junction
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
    nss
    nvd
    obsidian
    oh-my-zsh
    opentofu
    owofetch
    # picom-pijulius
    plasma-browser-integration
    playerctl
    powertop
    (python3.withPackages (ps: [ps.ansible ps.dnspython ps.pip ps.requests]))
    # quickemu
    # quickgui
    ripgrep
    scanmem
    slack
    smartmontools
    space-cadet-pinball
    spice
    super-productivity
    thunderbird-unwrapped
    tldr
    unar
    unzip
    usbtop
    usbutils
    uwuify
    vim
    vlc
    vscode-fhs
    wget
    wl-clipboard
    xclip
    xsel
    xwayland
    yank
    yazi
    zed-editor
    zoxide
    zsa-udev-rules
    zsh
  ];
}
