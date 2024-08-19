{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    ansible
    ansible-doctor
    # ansible-navigator
    appimage-run
    # barrier
    bat
    bitwarden
    bitwarden-cli
    btop
    catppuccin
    catppuccin-kvantum
    catppuccin-papirus-folders
    clinfo
    # delta
    eza
    fastfetch
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
    git
    gh
    glxinfo
    gnupg1
    gparted
    helm-docs
    helmfile
    home-manager
    imagemagick
    hyfetch
    input-leap
    junction
    jq
    kate
    kdialog
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
    neovim
    nix-output-monitor
    nvd
    obsidian
    oh-my-zsh
    opentofu
    owofetch
    plasma-browser-integration
    playerctl
    powertop
    ripgrep
    scanmem
    slack
    smartmontools
    space-cadet-pinball
    thunderbird
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
    zsh
  ];
}
