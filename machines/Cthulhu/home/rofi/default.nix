{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "FiraCode Nerd Font Ret 12";
    location = "center";
    terminal = "${pkgs.kitty}/bin/kitty";
    plugins = [
      pkgs.rofi-calc
      pkgs.rofi-network-manager
      pkgs.rofi-emoji-wayland
      pkgs.rofi-file-browser
      pkgs.rofi-power-menu
      pkgs.rofi-bluetooth
      pkgs.rofi-obsidian
      pkgs.rofi-systemd
      pkgs.rofi-vpn
    ];
    extraConfig = {
      modi = "combi,run,drun,window";
      icon-theme = "Papirus";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      drun-show-actions = true;
      disable-history = false;
      hide-scrollbar = true;
      display-combi = " 󰶮  All ";
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " 󰕰  Window";
      display-Network = " 󰤨  Network";
      sidebar-mode = true;
      sorting-method = "fzf";
    };
  };

  catppuccin.rofi = {
    enable = true;
    flavor = "mocha";
  };
}
