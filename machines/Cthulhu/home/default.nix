{...}: {
  home.stateVersion = "24.11";

  nixpkgs = {
    config.allowUnfree = true;
    config.allowUnfreePredicate = _: true;
  };

  # *.nix file can be omitted if the name is default.nix
  imports = [
    ./avizo
    ./aws
    ./bat
    ./btop
    ./catppuccin
    ./cursor
    ./dconf
    ./dir
    # ./droidcam
    ./dunst
    ./firefox
    ./fonts
    ./fzf
    ./ghostty
    ./git
    ./go
    ./hypridle
    ./hyprland
    ./hyprlock
    ./kdePackages
    ./keyboard
    ./kitty
    ./lan-mouse
    ./lazygit
    ./lsps
    ./mime
    ./neovim
    ./pyprland
    ./rofi
    ./ssh
    ./swappy
    ./tealdeer
    ./thunderbird
    ./tools
    ./wallpaper
    ./waybar
    ./wlogout
    ./yazi
    ./zsh
  ];

  xdg.enable = true;

  home.sessionVariables = {
    SSH_ASKPASS = "ksshaskpass";
    SSH_ASKPASS_REQUIRE = "prefer";

    GIT_ASKPASS = "ksshaskpass";
  };
}
