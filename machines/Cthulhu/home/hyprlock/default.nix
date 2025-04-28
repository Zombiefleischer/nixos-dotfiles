{...}: {
  wayland.windowManager.hyprland.enable = true;

  # Configure Hyprlock
  programs.hyprlock = {
    enable = true;

    settings = {
      "$font" = "FiraCode Nerd Font Ret";

      # # GENERAL
      general = {
        hide_cursor = false;
        grace = 10;
      };
      #
      # # BACKGROUND
      # background = {
      #   monitor = "";
      #   path = "$HOME/.config/background.png";
      #   blur_passes = 2;
      #   # color = "$base";
      # };
      #
      # # TIME
      # label = [
      #   {
      #     monitor = "";
      #     text = "cmd[update:30000] echo \"$(date +\"%H:%M\")\"";
      #     # color = "$text";
      #     font_size = 90;
      #     font_family = "$font";
      #     position = "-130, -100";
      #     halign = "right";
      #     valign = "top";
      #     shadow_passes = 2;
      #   }
      #
      #   # DATE
      #   {
      #     monitor = "";
      #     text = ''cmd[update:43200000] echo "$(date +"%A, %d %B 1%Y")"'';
      #     color = "$text";
      #     font_size = 25;
      #     font_family = "$font";
      #     position = "-130, -250";
      #     halign = "right";
      #     valign = "top";
      #     shadow_passes = 2;
      #   }
      # ];
      #
      # # USER AVATAR
      # image = {
      #   monitor = "";
      #   path = "$HOME/.face";
      #   size = 350;
      #   border_color = "$accent";
      #   rounding = -1;
      #   position = "0, 75";
      #   halign = "center";
      #   valign = "center";
      #   shadow_passes = 2;
      # };
      #
      # # INPUT FIELD
      # input-field = {
      #   monitor = "";
      #   size = "400, 70";
      #   outline_thickness = 4;
      #   dots_size = 0.2;
      #   dots_spacing = 0.2;
      #   dots_center = true;
      #   outer_color = "$accent";
      #   inner_color = "$surface0";
      #   font_color = "$text";
      #   fade_on_empty = false;
      #   placeholder_text = "<span foreground=\"##$textAlpha\"><i>󰌾 Logged in as </i><span foreground=\"##$accentAlpha\">$USER</span></span>";
      #   hide_input = false;
      #   check_color = "$sky";
      #   fail_color = "$red";
      #   fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></&>";
      #   capslock_color = "$yellow";
      #   position = "0, -185";
      #   halign = "center";
      # valign = "center";
      # shadow_passes = 2;
      # };
    };
  };

  catppuccin.hyprlock = {
    enable = true;
    accent = "sapphire";
    flavor = "mocha";
  };
}
