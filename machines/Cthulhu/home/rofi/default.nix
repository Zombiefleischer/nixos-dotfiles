{
  config,
  pkgs,
  ...
}: {
  home.file.".config/rofi/images/b.png".source = ./b.png;
  home.file.".config/rofi/images/a.png".source = ./a.png;

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "FiraCode Nerd Font Ret 12";
    location = "center";
    terminal = "${pkgs.ghostty}/bin/ghostty";
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
      modi = "combi,run,drun,window,filebrowser";
      icon-theme = "Papirus";
      show-icons = true;
      display-combi = " 󰶮  All ";
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " 󰕰  Window";
      display-network = " 󰤨  Network";
      display-filebrowser = "   Files";
      drun-display-format = "{icon} {name}";
      window-format = "{w} · {c} · {t}";

      # Extra Config
      sidebar-mode = true;
      sorting-method = "fzf";
      drun-show-actions = true;
      disable-history = false;
    };

    theme = let
      # Use `mkLiteral` for string-like values that should show without
      # quotes, e.g.:
      # {
      #   foo = "abc"; => foo: "abc";
      #   bar = mkLiteral "abc"; => bar: abc;
      # };
      mkLiteral = config.lib.formats.rasi.mkLiteral;
    in {
      # Global Properties
      "*" = {
        # background = mkLiteral "#180F39";
        background = mkLiteral "#1E1E2E";
        # background-alt = mkLiteral "#32197D";
        background-alt = mkLiteral "#313244";
        # foreground = mkLiteral "#FFFFFF";
        foreground = mkLiteral "#CDD6F4";
        # selected = mkLiteral "#FF00F1";
        selected = mkLiteral "#74C7EC";
        # active = mkLiteral "#9878FF";
        active = mkLiteral "#89B4FA";
        # urgent = mkLiteral "#7D0075";
        urgent = mkLiteral "#89DCEB";
      };

      # Main Window
      window = {
        # properties for window widget
        transparency = "real";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        fullscreen = false;
        width = mkLiteral "1400px";
        x-offset = mkLiteral "0px";
        y-offset = mkLiteral "0px";

        # properties for all widgets
        enabled = true;
        border-radius = mkLiteral "20px";
        cursor = "default";
        background-color = mkLiteral "@background";
      };

      # Main Box
      mainbox = {
        enabled = true;
        spacing = mkLiteral "0px";
        background-color = mkLiteral "transparent";
        orientation = mkLiteral "vertical";
        children = mkLiteral "[\"inputbar\", \"listbox\"]";
      };

      listbox = {
        spacing = mkLiteral "20px";
        padding = mkLiteral "20px";
        background-color = mkLiteral "transparent";
        orientation = mkLiteral "vertical";
        children = mkLiteral "[\"message\", \"listview\"]";
      };

      # Inputbar
      inputbar = {
        enabled = true;
        spacing = mkLiteral "10px";
        padding = mkLiteral "80px 60px";
        background-color = mkLiteral "transparent";
        # background-image = mkLiteral "url(\"~/.config/rofi/images/b.png\", width)";
        background-image = mkLiteral "url(\"~/.config/rofi/images/a.png\", width)";
        text-color = mkLiteral "@foreground";
        orientation = mkLiteral "horizontal";
        children = mkLiteral "[\"textbox-prompt-colon\", \"entry\", \"dummy\", \"mode-switcher\"]";
      };

      textbox-prompt-colon = {
        enabled = true;
        expand = false;
        str = "  ";
        padding = mkLiteral "12px 15px";
        border-radius = mkLiteral "100%";
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "inherit";
      };

      entry = {
        enabled = true;
        expand = false;
        width = mkLiteral "300px";
        padding = mkLiteral "12px 16px";
        border-radius = mkLiteral "100%";
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "text";
        placeholder = "Search";
        placeholder-color = mkLiteral "inherit";
      };

      dummy = {
        expand = true;
        background-color = mkLiteral "transparent";
      };

      # Mode Switcher
      mode-switcher = {
        enabled = true;
        spacing = mkLiteral "10px";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
      };

      button = {
        width = mkLiteral "120px";
        padding = mkLiteral "12px";
        border-radius = mkLiteral "100%";
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "pointer";
      };

      "button selected" = {
        background-color = mkLiteral "@selected";
        text-color = mkLiteral "@background";
      };

      # Listview
      listview = {
        enabled = true;
        columns = 2;
        lines = 8;
        cycle = true;
        dynamic = true;
        scrollbar = false;
        layout = mkLiteral "vertical";
        reverse = false;
        fixed-height = true;
        fixed-columns = true;

        spacing = mkLiteral "10px";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
        cursor = "default";
      };

      # Elements
      element = {
        enabled = true;
        spacing = mkLiteral "10px";
        padding = mkLiteral "4px";
        border-radius = mkLiteral "100%";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
        cursor = mkLiteral "pointer";
      };

      "element normal.normal" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "element normal.urgent" = {
        background-color = mkLiteral "@urgent";
        text-color = mkLiteral "@background";
      };

      "element normal.active" = {
        background-color = mkLiteral "@active";
        text-color = mkLiteral "@background";
      };

      "element selected.normal" = {
        background-color = mkLiteral "@selected";
        text-color = mkLiteral "@background";
      };

      "element selected.urgent" = {
        background-color = mkLiteral "@urgent";
        text-color = mkLiteral "@background";
      };

      "element selected.active" = {
        background-color = mkLiteral "@urgent";
        text-color = mkLiteral "@background";
      };

      "element-icon" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        size = mkLiteral "32px";
        cursor = mkLiteral "inherit";
      };

      "element-text" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
      };

      # Message
      message = {
        background-color = mkLiteral "transparent";
      };

      textbox = {
        padding = mkLiteral "12px";
        broder-radius = mkLiteral "100%";
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "@foreground";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
      };

      error-message = {
        padding = mkLiteral "12px";
        border-radius = mkLiteral "20px";
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
      };
    };
  };

  catppuccin.rofi = {
    enable = false;
    flavor = "mocha";
  };
}
