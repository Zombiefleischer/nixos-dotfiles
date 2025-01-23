{...}:{

  programs.waybar = {
    enable = true;

    catppuccin = {
      enable = true;
      flavor = "mocha";
      mode = "prependImport";
    };

    systemd.enable = true;

    settings = [
      # Double Bar Config

      # Top Bar Config
      {
        # Main Config
        name = "top_bar";
        layer = "top"; # Waybar at top layer
        position = "top"; # Waybar position (top|bottom|left|right)
        height = 36; # Waybar height (to be removed for auto height)
        spacing = 4; # Gaps between modules (4px)
        modules-left = [ "hyprland/workspaces" "hyprland/submap" ];
        modules-center = [ "clock#time" "custom/separator" "clock#week" "custom/separator_dot" "clock#month" "custom/separator" "clock#calendar" ];
        modules-right = [ "bluetooth" "network" "group/misc" "custom/logout_menu" ];

        # Modules Config
        "hyprland/workspaces" = {
          on-click = "activate";
          format = "{icon}";
          format-icons = {
            "1" = "󰲠";
            "2" = "󰲢";
            "3" = "󰲤";
            "4" = "󰲦";
            "5" = "󰲨";
            "6" = "󰲪";
            "7" = "󰲬";
            "8" = "󰲮";
            "9" = "󰲰";
            "10" = "󰿬";
            "special" = "";

            # "active" = "",
            # "default" = "",
            # "empty" = ""
          };

          show-special = true;
          persistent-workspaces = {
            "*" = 10;
          };
        };

        "hyprland/submap" = {
          format = "<span color='#a6e3a1'>Mode:</span> {}";
          tooltip = false;
        };

        "clock#time" = {
          format = "{:%H:%M %Z %Ez}";
          # locale = "en_US.UTF-8"
          # timezones = [ "Europe/Berlin" ]
        };

        "custom/separator" = {
          format = "|";
          tooltip = false;
        };

        "custom/separator_dot" = {
          format = "•";
          tooltip = false;
        };

        "clock#week" = {
          format = "{:%a}";
        };

        "clock#month" = {
          format = "{:%h}";
        };

        "clock#calendar" = {
          format = "{:%F}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          actions = {
            on-click-right = "mode";
          };
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#f4dbd6'><b>{}</b></span>";
              days = "<span color='#cad3f5'><b>{}</b></span>";
              weeks = "<span color='#c6a0f6'><b>W{}</b></span>";
              weekdays = "<span color='#a6da95'><b>{}</b></span>";
              today = "<span color='#8bd5ca'><b><u>{}</u></b></span>";
            };
          };
        };

        "bluetooth" = {
          format = "󰂯";
          format-disabled = "󰂲";
          format-connected = "󰂱 {device_alias}";
          format-connected-battery = "󰂱 {device_alias} (󰥉 {device_battery_percentage}%)";
          tooltip-format = "{controller_alias}\t{controller_address} ({status})\n\n{num_connections} connected";
          tooltip-format-disabled = "bluetooth off";
          tooltip-format-connected = "{controller_alias}\t{controller_address} ({status})\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t({device_battery_percentage}%)";
          max-length = 35;
          on-click = "fish -c bluetooth_toggle"; # TODO Change Command, implement zsh functions
          on-click-right = "overskride";
        };
      }
    ];
  };
}
