{...}: {
  programs.kitty = {
    enable = true;

    font = {
      name = "FiraCode Nerd Font Ret";
      size = 14.0;
    };

    shellIntegration = {
      enableZshIntegration = true;
      mode = "no-cursor";
    };

    theme = "Catppuccin-Macchiato";

    settings = {
      # Cursor customization
      cursor_shape = "block";

      # Scrollback
      scrollback_lines = 10000;

      # Mouse
      copy_on_select = "clipboard";
      strip_trailing_spaces = "smart";

      # Terminal bell
      enable_audio_bell = false;
      window_alert_on_bell = false;

      # Window layout
      enabled_layouts = "splits:split_axis=horizontal,grid";
      hide_window_decoration = true;

      # Tab bar
      tab_bar_style = "powerline";
      tab_title_template = ''"{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}{sup.index}{title}"'';

      # Color scheme
      background_opacity = "0.75";
      dynamic_background_opacity = true;

      # Advanced
      update_check_interval = 0;
    };

    keybindings = {
      # Clipboard
      "kitty_mod+c" = "copy_to_clipboard";
      "kitty_mod+v" = "paste_from_clipboard";
      "kitty_mod+s" = "paste_from_selection";

      # Scrolling
      "kitty_mod+up" = "scroll_line_up";
      "kitty_mod+k" = "scroll_line_up";
      "kitty_mod+down" = "scroll_line_down";
      "kitty_mod+j" = "scroll_line_down";
      "kitty_mod+page_up" = "scroll_page_up";
      "kitty_mod+page_down" = "scroll_page_down";
      "kitty_mod+home" = "scroll_home";
      "kitty_mod+end" = "scroll_end";
      "kitty_mod+z" = "scroll_to_prompt -1";
      "kitty_mod+x" = "scroll_to_prompt 1";

      # Window management
      "kitty_mod+enter" = "new_window";
      "kitty_mod+n" = "new_os_window";
      "kitty_mod+w" = "close_window";
      "kitty_mod+]" = "next_window";
      "kitty_mod+[" = "previous_window";
      "kitty_mod+f" = "move_window_forward";
      "kitty_mod+b" = "move_window_backward";
      "kitty_mod+`" = "move_window_to_top";
      "kitty_mod+r" = "start_resizing_window";
      "kitty_mod+1" = "first_window";
      "kitty_mod+2" = "second_window";
      "kitty_mod+3" = "third_window";
      "kitty_mod+4" = "fourth_window";
      "kitty_mod+5" = "fifth_window";
      "kitty_mod+6" = "sixth_window";
      "kitty_mod+7" = "seventh_window";
      "kitty_mod+8" = "eighth_window";
      "kitty_mod+9" = "ninth_window";
      "kitty_mod+0" = "tenth_window";
      "kitty_mod+f7" = "focus_visible_window";
      "kitty_mod+f6" = "swap_with_window";
      "ctrl+f4" = "detach_window ask";

      # Tab management
      "kitty_mod+right" = "next_tab";
      "ctrl+tab" = "next_tab";
      "kitty_mod+left" = "previous_tab";
      "ctrl+shift+tab" = "previous_tab";
      "kitty_mod+t" = "new_tab_with_cwd";
      "kitty_mod+q" = "close_tab";
      "kitty_mod+." = "move_tab_forward";
      "kitty_mod+," = "move_tab_backward";
      "kitty_mod+alt+t" = "set_tab_title";

      # Layout management
      "kitty_mod+l" = "next_layout";
      "kitty_mod+backslash" = "launch --location=vsplit --cwd=current";
      "kitty_mod+minus" = "launch --location=hsplit --cwd=current";

      # Font sizes
      "kitty_mod+equal" = "change_font_size all +1.0";
      "kitty_mod+plus" = "change_font_size all +1.0";
      "kitty_mod+kp_add" = "change_font_size all +1.0";
      "kitty_mod+kp_subtract" = "change_font_size all -1.0";
      "kitty_mod+backspace" = "change_font_size all 0";

      # Miscellaneous
      "kitty_mod+f9" = "set_background_opacity +0.1";
      "kitty_mod+f10" = "set_background_opacity -0.1";
      "kitty_mod+f8" = "set_background_opacity 1";
      "f6" = "create_marker";
      "f7" = "remove_marker";
    };

    # extraConfig = "";
  };
}
