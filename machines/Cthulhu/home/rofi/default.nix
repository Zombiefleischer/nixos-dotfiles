{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "FiraCode Nerd Font Ret 12";
    location = "center";
    terminal = "${pkgs.kitty}/bin/kitty";
    plugins = [
      pkgs.rofi-calc
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

    catppuccin = {
      enable = true;
      flavor = "mocha";
    };
  };
}
