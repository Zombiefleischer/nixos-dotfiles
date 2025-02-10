{...}: {
  programs.waybar = {
    enable = true;

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
        modules-left = ["hyprland/workspaces" "hyprland/submap"];
        modules-center = ["clock#time" "custom/separator" "clock#week" "custom/separator_dot" "clock#month" "custom/separator" "clock#calendar"];
        modules-right = ["bluetooth" "network" "custom/vpn" "group/misc" "custom/logout_menu"];

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

            # "active" = " ",
            # "default" = " ",
            # "empty" = " "
          };

          show-special = true;
          persistent-workspaces = {
            "*" = 10;
            "DP-7" = [1 2 3 4 5 6 7 8 9 10];
            "DP-5" = [10];
          };
        };

        "hyprland/submap" = {
          format = "<span color='#a6e3a1'>Mode:</span> {}";
          tooltip = false;
        };

        "clock#time" = {
          format = "{:%H:%M:%S %Z %Ez}";
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

        "custom/media" = {
          format = "{icon}󰎈 ";
          restart-interval = 2;
          return-type = "json";
          format-icons = {
            Playing = " ";
            Paused = " ";
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
          on-click = "zsh -c bluetooth_toggle";
          on-click-right = "overskride";
        };

        "network" = {
          format = "󰤭 ";
          format-wifi = "{icon}({signalStrength}%){essid}";
          format-icons = ["󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 "];
          format-disconnected = "󰪎  Disconnected";
          tooltip-format = "wifi <span color='#ee99a0'>off</span>";
          tooltip-format-wifi = "SSID: {essid}({signalStrength}%), {frequency} MHz\nInterface: {ifname}\nIP: {ipaddr}\nGW: {gwaddr}\n\n<span color='#a6da95'>{bandwidthUpBits}</span>\t<span color='#ee99a0'>{bandwidthDownBits}</span>\t<span color='#c6a0f6'>󰹹{bandwidthTotalBits}</span>";
          tooltip-format-disconnected = "<span color='#ed8796'>disconnected</span>";
          format-ethernet = "󰈀  {ipaddr}/{cidr}";
          format-linked = "󰈀  {ifname} (No IP)";
          tooltip-format-ethernet = "Interface: {ifname}\nIP: {ipaddr}\nGW: {gwaddr}\nNetmask: {netmask}\nCIDR: {cidr}\n\n<span color='#a6da95'>{bandwidthUpBits}</span>\t<span color='#ee99a0'>{bandwidthDownBits}</span>\t<span color='#c6a0f6'>󰹹{bandwidthTotalBits}</span>";
          max-length = 35;
          on-click = "zsh -c wifi_toggle";
          on-click-right = "nm-connection-editor";
        };

        "custom/vpn" = {
          format = "VPN  ";
          exec = "echo '{\"class\": \"connected\"}'";
          exec-if = "test -d /proc/sys/net/ipv4/conf/tun0";
          return-type = "json";
          interval = 5;
        };

        "group/misc" = {
          orientation = "horizontal";
          modules = [
            "custom/webcam"
            "privacy"
            "custom/recording"
            "custom/media"
            "custom/dunst"
            "custom/airplane_mode"
            "idle_inhibitor"
          ];
        };

        "custom/webcam" = {
          interval = 1;
          exec = "zsh -c check_webcam";
          return-type = "json";
        };

        "privacy" = {
          icon-spacing = 1;
          icon-size = 12;
          transition-duration = 250;
          modules = [
            {
              type = "audio-in";
            }
            {
              type = "screenshare";
            }
          ];
        };

        "custom/recording" = {
          interval = 1;
          exec-if = "pgrep wl-screenrec";
          exec = "zsh -c check_recording";
          return-type = "json";
        };

        "custom/airplane_mode" = {
          interval = 1;
          exec = "zsh -c 'source ~/.zsh/functions.zsh' && zsh -c check_airplane_mode";
          on-click = "zsh -c airplane_mode_toggle";
          return-type = "json";
        };

        "custom/dunst" = {
          exec = "zsh -c 'source ~/.zsh/functions.zsh' && zsh -c dunst_pause";
          on-click = "dunstctl set-paused toggle";
          restart-interval = 1;
          return-type = "json";
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "󰛐 ";
            deactivated = "󰛑 ";
          };
          tooltip-format-activated = "idle-inhibitor <span color='#a6da95'>on</span>";
          tooltip-format-deactivated = "idle-inhibitor <span color='#ee99a0'>off</span>";
          start-activated = true;
        };

        "custom/logout_menu" = {
          return-type = "json";
          exec = "echo '{ \"text\":\"󰐥 \", \"tooltip\": \"logout menu\" }'";
          interval = "once";
          on-click = "zsh -c wlogout_unique";
        };
      }

      # Bottom Bar Config
      {
        # Main Config
        name = "bottom_bar";
        layer = "top"; # Waybar at top layer
        position = "bottom"; # Waybar position (top|bottom|left|right)
        height = 36; # Waybar height (to be removed for auto height)
        spacing = 4; # Gaps between modules (4px)
        modules-left = ["user"];
        modules-center = ["hyprland/window"];
        modules-right = ["keyboard-state"];

        # Modules Config
        "hyprland/window" = {
          format = "  {title} 󰭟 ";
          max-length = 50;
        };

        "keyboard-state" = {
          capslock = true;
          numlock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = " ";
            unlocked = " ";
          };
        };

        "user" = {
          format = " 󰄛  <span color='#8bd5ca'>{user}</span> (up <span color='#f5bde6'>{work_d} d</span> <span color='#8aadf4'>{work_H} h</span> <span color='#eed49f'>{work_M} min</span> <span color='#a6da95'>↑</span>)";
          icon = true;
        };
      }

      # Left Bar Config
      {
        # Main Config
        name = "left_bar";
        layer = "top"; # Waybar at top layer
        position = "left"; # Waybar position (top|bottom|left|right)
        spacing = 4; # Gaps between modules (4px)
        width = 75;
        margin-top = 10;
        margin-bottom = 10;
        modules-left = ["wlr/taskbar"];
        modules-center = ["cpu" "memory" "disk" "temperature" "battery" "backlight" "pulseaudio" "systemd-failed-units"];
        modules-right = ["tray"];

        # Modules Config
        "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 20;
          icon-theme = "catppuccin-papirus-folders";
          tooltip-format = "{title}";
          on-click = "activate";
          on-click-right = "close";
          on-click-middle = "fullscreen";
        };

        "tray" = {
          icon-size = 20;
          spacing = 2;
        };

        "cpu" = {
          format = "󰻠  {usage}%";
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          on-click = "ghostty -e btop";
        };

        "memory" = {
          format = "  {percentage}%";
          tooltip-format = "Main: ({used} GiB/{total} GiB)({percentage}%), available {avail} GiB\nSwap: ({swapUsed} GiB/{swapTotal} GiB)({swapPercentage}%), available {swapAvail} GiB";
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          on-click = "ghostty -e btop";
        };

        "disk" = {
          format = "󰋊  {percentage_used}%";
          tooltip-format = "({used}/{total})({percentage_used}%) in '{path}', available {free}({percentage_free}%)";
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          on-click = "ghostty -e btop";
        };

        "temperature" = {
          tooltip = false;
          thermal-zone = 6;
          critical-threshold = 80;
          format = "{icon}{temperatureC}󰔄 ";
          format-critical = "󱗗{icon}{temperatureC}󰔄 ";
          format-icons = [" " " " " " " " " "];
        };

        "battery" = {
          "states" = {
            "high" = 90;
            "upper-medium" = 70;
            "medium" = 50;
            "lower-medium" = 30;
            "low" = 10;
          };
          format = "{icon}{capacity}%";
          format-charging = "󱐋{icon}{capacity}%";
          format-plugged = "󰚥{icon}{capacity}%";
          format-time = "{H} h {M} min";
          format-icons = ["󱃍 " "󰁺 " "󰁻 " "󰁼 " "󰁽 " "󰁾 " "󰁿 " "󰂀 " "󰂁 " "󰂂 " "󰁹 "];
          tooltip-format = "{timeTo}";
        };

        "backlight" = {
          format = "{icon}{percent}%";
          format-icons = [
            "󰌶 "
            "󱩎 "
            "󱩏 "
            "󱩐 "
            "󱩑 "
            "󱩒 "
            "󱩓 "
            "󱩔 "
            "󱩕 "
            "󱩖 "
            "󰛨 "
          ];
          tooltip = false;
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          reverse-scrolling = true;
          reverse-mouse-scrolling = true;
        };

        "pulseaudio" = {
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          tooltip-format = "{desc}";
          format = "{icon}{volume}%\n{format_source}";
          format-bluetooth = "󰂱 {icon}{volume}%\n{format_source}";
          format-bluetooth-muted = "󰂱 󰝟 {volume}%\n{format_source}";
          format-muted = "󰝟 {volume}%\n{format_source}";
          format-source = "󰍬 {volume}%";
          format-source-muted = "󰍭 {volume}%";
          format-icons = {
            "headphone" = "󰋋 ";
            "hands-free" = " ";
            "headset" = "󰋎 ";
            "phone" = "󰄜 ";
            "portable" = "󰦧 ";
            "car" = "󰄋 ";
            "speaker" = "󰓃 ";
            "hdmi" = "󰡁 ";
            "hifi" = "󰋌 ";
            "default" = [
              "󰕿 "
              "󰖀 "
              "󰕾 "
            ];
          };
          reverse-scrolling = true;
          reverse-mouse-scrolling = true;
          on-click = "pavucontrol";
        };

        "systemd-failed-units" = {
          format = "✗ {nr_failed}";
        };
      }
    ];

    style = 
    /* css */
    ''
      * {
        border: none;
        /* font-family: "Fira Code Nerd Font", "Noto Color Emoji", sans-serif; */
      }

      window.bottom_bar#waybar {
        background-color: alpha(@base, 0.7);
        border-top: solid alpha(@surface1, 0.7) 2;
      }

      window.top_bar#waybar {
        background-color: alpha(@base, 0.7);
        border-bottom: solid alpha(@surface1, 0.7) 2;
      }

      window.left_bar#waybar {
        background-color: alpha(@base, 0.7);
        border-top: solid alpha(@surface1, 0.7) 2;
        border-right: solid alpha(@surface1, 0.7) 2;
        border-bottom: solid alpha(@surface1, 0.7) 2;
        border-radius: 0 15 15 0;
      }

      window.bottom_bar .modules-center {
        background-color: alpha(@surface1, 0.7);
        color: @green;
        border-radius: 15;
        padding-left: 20;
        padding-right: 20;
        margin-top: 5;
        margin-bottom: 5;
      }

      window.bottom_bar .modules-left {
        background-color: alpha(@surface1, 0.7);
        border-radius: 0 15 15 0;
        padding-left: 20;
        padding-right: 20;
        margin-top: 5;
        margin-bottom: 5;
      }

      window.bottom_bar .modules-right {
        background-color: alpha(@surface1, 0.7);
        border-radius: 15 0 0 15;
        padding-left: 20;
        padding-right: 20;
        margin-top: 5;
        margin-bottom: 5;
      }

      #user {
        padding-left: 10;
      }

      #language {
        padding-left: 15;
      }

      #keyboard-state label.locked {
        color: @yellow;
      }

      #keyboard-state label {
        color: @subtext0;
      }

      #workspaces {
        margin-left: 10;
      }

      #workspaces button {
        color: @text;
        font-size: 1.25rem;
      }

      #workspaces button.empty {
        color: @overlay0;
      }

      #workspaces button.active {
        color: @peach;
      }

      #submap {
        background-color: alpha(@surface1, 0.7);
        border-radius: 15;
        padding-left: 15;
        padding-right: 15;
        margin-left: 20;
        margin-right: 20;
        margin-top: 5;
        margin-bottom: 5;
      }

      window.top_bar .modules-center {
        font-weight: bold;
        background-color: alpha(@surface1, 0.7);
        color: @peach;
        border-radius: 15;
        padding-left: 20;
        padding-right: 20;
        margin-top: 5;
        margin-bottom: 5;
      }

      #custom-separator {
        color: @green;
      }

      #custom-separator_dot {
        color: @green;
      }

      #clock.time {
        color: @flamingo;
      }

      #clock.week {
        color: @sapphire;
      }

      #clock.month {
        color: @sapphire;
      }

      #clock.calendar {
        color: @mauve;
      }

      #bluetooth {
        background-color: alpha(@surface1, 0.7);
        border-radius: 15;
        padding-left: 15;
        padding-right: 15;
        margin-top: 5;
        margin-bottom: 5;
      }

      #bluetooth.disabled {
        background-color: alpha(@surface0, 0.7);
        color: @subtext0;
      }

      #bluetooth.on {
        color: @blue;
      }

      #bluetooth.connected {
        color: @sapphire;
      }

      #network {
        background-color: alpha(@surface1, 0.7);
        border-radius: 15;
        padding-left: 15;
        padding-right: 15;
        margin-left: 2;
        margin-right: 2;
        margin-top: 5;
        margin-bottom: 5;
      }

      #network.disabled {
        background-color: alpha(@surface0, 0.7);
        color: @subtext0;
      }

      #network.disconnected {
        color: @red;
      }

      #network.wifi {
        color: @teal;
      }

      #idle_inhibitor {
        margin-right: 2;
      }

      #idle_inhibitor.deactivated {
        color: @subtext0;
      }

      #custom-dunst.off {
        color: @subtext0;
      }

      #custom-airplane_mode {
        margin-right: 2;
      }

      #custom-airplane_mode.off {
        color: @subtext0;
      }

      #custom-night_mode {
        margin-right: 2;
      }

      #custom-night_mode.off {
        color: @subtext0;
      }

      #custom-dunst {
        margin-right: 2;
      }

      #custom-media.Paused {
        color: @subtext0;
      }

      #custom-webcam {
        color: @maroon;
        margin-right: 3;
      }

      #privacy-item.screenshare {
        color: @peach;
        margin-right: 5;
      }

      #privacy-item.audio-in {
        color: @pink;
        margin-right: 4;
      }

      #custom-recording {
        color: @red;
        margin-right: 4;
      }

      #custom-geo {
        color: @yellow;
        margin-right: 4;
      }

      #custom-logout_menu {
        color: @red;
        background-color: alpha(@surface1, 0.7);
        border-radius: 15 0 0 15;
        padding-left: 10;
        padding-right: 5;
        margin-top: 5;
        margin-bottom: 5;
      }

      window.left_bar .modules-center {
        background-color: alpha(@surface1, 0.7);
        border-radius: 0 15 15 0;
        margin-right: 5;
        margin-top: 15;
        margin-bottom: 15;
        padding-top: 5;
        padding-bottom: 5;
      }

      #taskbar {
        margin-top: 10;
        margin-right: 10;
        margin-left: 10;
      }

      #taskbar button.active {
        background-color: alpha(@surface1, 0.7);
        border-radius: 10;
      }

      #tray {
        margin-bottom: 10;
        margin-right: 10;
        margin-left: 10;
      }

      #tray>.needs-attention {
        background-color: alpha(@maroon, 0.7);
        border-radius: 10;
      }

      #cpu {
        color: @sapphire;
      }

      #cpu.low {
        color: @rosewater;
      }

      #cpu.lower-medium {
        color: @yellow;
      }

      #cpu.medium {
        color: @peach;
      }

      #cpu.upper-medium {
        color: @maroon;
      }

      #cpu.high {
        color: @red;
      }

      #memory {
        color: @sapphire;
      }

      #memory.low {
        color: @rosewater;
      }

      #memory.lower-medium {
        color: @yellow;
      }

      #memory.medium {
        color: @peach;
      }

      #memory.upper-medium {
        color: @maroon;
      }

      #memory.high {
        color: @red;
      }

      #disk {
        color: @sapphire;
      }

      #disk.low {
        color: @rosewater;
      }

      #disk.lower-medium {
        color: @yellow;
      }

      #disk.medium {
        color: @peach;
      }

      #disk.upper-medium {
        color: @maroon;
      }

      #disk.high {
        color: @red;
      }

      #temperature {
        color: @green;
      }

      #temperature.critical {
        color: @red;
      }

      #battery {
        color: @teal;
      }

      #battery.low {
        color: @red;
      }

      #battery.lower-medium {
        color: @maroon;
      }

      #battery.medium {
        color: @peach;
      }

      #battery.upper-medium {
        color: @flamingo;
      }

      #battery.high {
        color: @rosewater;
      }

      #backlight {
        color: @overlay0;
      }

      #backlight.low {
        color: @overlay1;
      }

      #backlight.lower-medium {
        color: @overlay2;
      }

      #backlight.medium {
        color: @subtext0;
      }

      #backlight.upper-medium {
        color: @subtext1;
      }

      #backlight.high {
        color: @text;
      }

      #pulseaudio.bluetooth {
        color: @sapphire;
      }

      #pulseaudio.muted {
        color: @surface2;
      }

      #pulseaudio {
        color: @text;
      }

      #pulseaudio.low {
        color: @overlay0;
      }

      #pulseaudio.lower-medium {
        color: @overlay1;
      }

      #pulseaudio.medium {
        color: @overlay2;
      }

      #pulseaudio.upper-medium {
        color: @subtext0;
      }

      #pulseaudio.high {
        color: @subtext1;
      }

      #systemd-failed-units {
        color: @red;
      }
    '';
  };

  catppuccin.waybar = {
    enable = true;
    flavor = "mocha";
    mode = "prependImport";
  };
}
