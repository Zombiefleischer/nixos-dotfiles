{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    xwayland.enable = true;

    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = ["--all"];
    };

    plugins = [];

    settings = {
      # Please note not all available settings / options are set here.
      # For a full list, see the wiki https://wiki.hyprland.org/

      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor = [
        "DP-7, 3440x1440@100, 0x560, 1"
        "DP-5, 2560x1440@70, 3440x0, 1, transform, 3"
        "eDP-1, disable"
      ];

      # See https://wiki.hyprland.org/Configuring/Keywords/ for more

      # Execute your favorite apps at launch
      exec-once = [
        "${pkgs.swww}/bin/swww-daemon"
        "${pkgs.slack}/bin/slack"
        "${pkgs.kdePackages.kwallet}/bin/kwalletd6"
        # "${pkgs.input-leap}/bin/input-leap"
        "${pkgs.thunderbird}/bin/thunderbird"
        "${pkgs.obsidian}/bin/obsidian"
        "${pkgs.libreoffice}/bin/libreoffice --calc '/home/zombiefleischer/Documents/Zeiterfassung_MS_2025.xlsx'"
        "${pkgs.poweralertd}/bin/poweralertd"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "wl-clip-persist --clipboard regular"
        "systemctl --user start psi-notify"
        "lan-mouse -d"
        "/home/zombiefleischer/scripts/swww_randomize_multi.sh /home/zombiefleischer/Pictures/i3_wallpapers"
      ];

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input = {
        kb_layout = "us";
        kb_variant = "intl";
        kb_model = "pc104";
        kb_options = "terminate:ctrl_alt_bksp";
        numlock_by_default = true;

        follow_mouse = 1;

        touchpad = {
          natural_scroll = "yes";
          tap-and-drag = true;
        };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "$sapphire";
        "col.inactive_border" = "$surface1";

        resize_on_border = true;

        layout = "dwindle";
      };

      decoration = {
        rounding = 10;

        blur = {
          size = 8;
          passes = 2;
        };

        shadow = {
          enabled = true;
          range = 15;
          render_power = 3;
          offset = "0, 0";
          color = "$sapphire";
          color_inactive = "0xff$baseAlpha";
        };

        active_opacity = 0.7;
        inactive_opacity = 0.7;
        fullscreen_opacity = 0.7;
      };

      animations = {
        enabled = "yes";

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 2, myBezier"
          "windowsOut, 1, 2, default, popin 80%"
          "border, 1, 3, default"
          "fade, 1, 2, default"
          "workspaces, 1, 1, default"
        ];
      };

      dwindle = {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = "yes"; # you probably want this
        smart_split = true;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        background_color = "$base";
      };

      binds = {
        workspace_back_and_forth = true;
      };

      # Workspaces
      workspace = [
        "1, monitor:DP-7, default:true"
        "2, monitor:DP-7"
        "3, monitor:DP-7"
        "4, monitor:DP-7"
        "9, monitor:DP-7"
        "10, monitor:DP-5, default:true"
      ];

      # Windowrule v1
      windowrule = [
        # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
        "opaque, firefox"
        "opaque, floorp"
        "opaque, title:(Slack)"
        "float, imv"
        "opaque, imv"
        "float, mpv"
        "opaque, mpv"
        "float, krunner"
        "float, Klipper"
      ];

      # Windowrule v2
      windowrulev2 = [
        "workspace 1, class:(com.mitchellh.ghostty)"
        "workspace 2, class:(firefox)"
        "workspace 3, class:(obsidian)"
        "workspace 4, class:(thunderbird)"
        "workspace 9, class:(soffice.bin)"
        "workspace 10, title:(Slack)"
        "noblur, class:(com.mitchellh.ghostty)"
      ];

      "$mainMod" = "SUPER";

      bindl = [
        # media controls
        ", XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        ", XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
        ", XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"

        # volume
        ", XF86AudioMute, exec, volumectl toggle-mute"
        ", XF86AudioMicMute, exec, volumectl -m toggle-mute"
      ];

      bindle = [
        # volume
        ", XF86AudioRaiseVolume, exec, volumectl -u up"
        ", XF86AudioLowerVolume, exec, volumectl -u down"

        # backlight
        ", XF86MonBrightnessUp, exec, lightctl up"
        ", XF86MonBrightnessDown, exec, lightctl down"
      ];
    };

    extraConfig = ''
      # will switch to a submap called resize
      bind=$mainMod ALT,R,submap,resize

      # will start a submap called "resize"
      submap=resize

      # sets repeatable binds for resizing the active window
      binde=,l,resizeactive,10 0
      binde=,h,resizeactive,-10 0
      binde=,k,resizeactive,0 -10
      binde=,j,resizeactive,0 10

      # use reset to go back to the global submap
      bind=,escape,submap,reset

      # will reset the submap, meaning end the current one and return to the global one
      submap=reset

      # will switch to a submap called move
      bind=$mainMod ALT,M,submap,move

      # will start a submap called "move"
      submap=move

      # sets repeatable binds for moving the active window
      bind=,l,movewindow,r
      bind=,h,movewindow,l
      bind=,k,movewindow,u
      bind=,j,movewindow,d

      # use reset to go back to the global submap
      bind=,escape,submap,reset

      # will reset the submap, meaning end the current one and return to the global one
      submap=reset

      # keybinds further down will be global again...

      # Scratchpads (dropdowns & togglable poppups)
      bind = $mainMod CTRL, T, exec, ${pkgs.pyprland}/bin/pypr toggle volume
      $volume_sidemenu = ^(pavucontrol)$
      windowrule = float, $volume_sidemenu

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      bind = $mainMod CTRL, M, togglespecialworkspace, minimized
      bind = $mainMod, M, exec, ${pkgs.pyprland}/bin/pypr toggle_special minimized
      bind = $mainMod CTRL, E, exec, ${pkgs.pyprland}/bin/pypr expose
      bind = $mainMod, Z, exec, ${pkgs.pyprland}/bin/pypr zoom

      bind = $mainMod SHIFT, L, exec, hyprlock

      # Move focus with mainMod + arrow keys
      bind = $mainMod, h, movefocus, l
      bind = $mainMod, l, movefocus, r
      bind = $mainMod, k, movefocus, u
      bind = $mainMod, j, movefocus, d
      bind = $mainMod, Tab, cyclenext,
      bind = $mainMod, Tab, bringactivetotop,

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, KP_1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, KP_2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, KP_3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, KP_4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, KP_5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, KP_6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, KP_7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, KP_8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, KP_9, workspace, 9
      bind = $mainMod, 0, workspace, 10
      bind = $mainMod, KP_0, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10
      bind = $mainMod SHIFT, KP_1, movetoworkspace, 1
      bind = $mainMod SHIFT, KP_2, movetoworkspace, 2
      bind = $mainMod SHIFT, KP_3, movetoworkspace, 3
      bind = $mainMod SHIFT, KP_4, movetoworkspace, 4
      bind = $mainMod SHIFT, KP_5, movetoworkspace, 5
      bind = $mainMod SHIFT, KP_6, movetoworkspace, 6
      bind = $mainMod SHIFT, KP_7, movetoworkspace, 7
      bind = $mainMod SHIFT, KP_8, movetoworkspace, 8
      bind = $mainMod SHIFT, KP_9, movetoworkspace, 9
      bind = $mainMod SHIFT, KP_0, movetoworkspace, 10

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      # Programs
      bind = $mainMod, B, exec, firefox
      bind = $mainMod SHIFT, B, exec, floorp
      bind = $mainMod, Enter, exec, ghostty
      bind = ALT CTRL, T, exec, ghostty
      bind = $mainMod, F, exec, dolphin
      bind = $mainMod, D, exec, rofi -show combi 
      bind = , code:225, exec, rofi -show combi 
      bind = $mainMod, C, exec, hyprpicker -a
      bind = $mainMod SHIFT, C, exec, pypr menu "Color picker"
      bind = $mainMod, T, exec, rofi -show calc -modi calc -no-show-match -no-sort
      bind = $mainMod SHIFT, Q, killactive
      bind = $mainMod SHIFT, F, togglefloating,
      bind = $mainMod CTRL, F, fullscreen, 0
      bind = $mainMod SHIFT, P, pseudo, # dwindle
      bind = $mainMod SHIFT, O, togglesplit, # dwindle
      bind = $mainMod ALT, M, exit,
      bind = $mainMod, G, togglegroup

      # ZSH Functions
      bind = $mainMod, ESCAPE, exec, zsh -c wlogout_uniqe
      bind = $mainMod SHIFT, S, exec, zsh -c screenshot_to_clipboard
      bind = $mainMod, E, exec, zsh -c screenshot_edit
      bind = $mainMod SHIFT, R, exec, zsh -c record_screen_gif
      bind = $mainMod, R, exec, zsh -c record_screen_mp4
      bind = $mainMod, V, exec, zsh -c clipboard_to_type
      bind = $mainMod SHIFT, V, exec, zsh -c clipboard_to_wlcopy
      bind = $mainMod, X, exec, zsh -c clipboard_delete_item
      bind = $mainMod SHIFT, X, exec, zsh -c clipboard_clear
      bind = $mainMod, U, exec, zsh -c bookmark_to_type
      bind = $mainMod SHIFT, U, exec, zsh -c bookmark_add
      bind = $mainMod CTRL, U, exec, zsh -c bookmark_delete
      bind = $mainMod SHIFT, A, exec, zsh -c airplane_mode_toggle
      bind = $mainMod SHIFT, N, exec, dunstctl set-paused toggle
      bind = $mainMod SHIFT, Y, exec, zsh -c bluetooth_toggle
      bind = $mainMod SHIFT, W, exec, zsh -c wifi_toggle
    '';
  };

  catppuccin.hyprland = {
    enable = true;
    accent = "sapphire";
    flavor = "mocha";
  };
}
