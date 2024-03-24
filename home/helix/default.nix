_: {
  programs.helix = {
    enable = true;

    settings = {
      theme = "catppuccin_frappe";
      editor = {
        line-number = "relative";
        cursorline = true;
        color-modes = true;
        idle-timeout = 1;
        true-color = true;
        rainbow-brackets = true;
        bufferline = "always";
        rulers = [80 120 160];
        popup-borders = "all";
        soft-wrap = {
          enable = true;
        };
        # completion-replace = true;

        sticky-context = {
          enable = true;
          indicator = false;
        };

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };

        whitespace = {
          render = "all";
          characters = {
            space = "·";
            nbsp = "⍽";
            tab = "→";
            newline = "⤶";
          };
        };

        file-picker = {
          hidden = false;
        };

        indent-guides = {
          render = true;
          character = "▏";
        };

        statusline = {
          left = ["mode" "spacer" "version-control" "spinner"];
          center = ["file-name" "read-only-indicator" "file-modification-indicator"];
          right = ["diagnostics" "selections" "register" "position" "position-percentage" "total-line-numbers" "file-encoding"];
          separator = "|";
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };
      };
      keys = {
        normal = {
          # Quick iteration on config changes
          C-o = ":config-open";
          C-r = ":config-reload";

          # Quick exit
          C-q = ":bc";

          # Quick scroll
          C-d = ["half_page_down" "align_view_center"];
          C-u = ["half_page_up" "align_view_center"];

          # Some nice Helix stuff
          C-h = "select_prev_sibling";
          C-j = "shrink_selection";
          C-k = "expand_selection";
          C-l = "select_next_sibling";

          # Muscle memory
          "0" = "goto_line_start";
          "$" = "goto_line_end";
          G = "goto_file_end";
          V = ["select_mode" "extend_to_line_bounds"];
          C = ["extend_to_line_end" "yank_main_selection_to_clipboard" "delete_selection" "insert_mode"];
          D = ["extend_to_line_end" "yank_main_selection_to_clipboard" "delete_selection"];
          S = "surround_add"; # Would be nice to be able to do something after this but it isn't chainable

          # Clipboards over registers ye ye
          x = "delete_selection";
          p = ["paste_clipboard_after" "collapse_selection"];
          P = ["paste_clipboard_before" "collapse_selection"];
          # Would be nice to add ya and yi, but the surround commands can't be chained
          Y = ["extend_to_line_end" "yank_main_selection_to_clipboard" "collapse_selection"];

          i = ["insert_mode" "collapse_selection"];
          a = ["append_mode" "collapse_selection"];

          # Undoing the 'd' + motion commands restores the selection which is annoying
          u = ["undo" "collapse_selection"];

          # Escape the madness! No more fighting with the cursor! Or with multiple cursors!
          esc = ["collapse_selection" "keep_primary_selection"];

          # Search for word under cursor
          "*" = ["move_char_right" "move_prev_word_start" "move_next_word_end" "search_selection" "search_next"];
          "#" = ["move_char_right" "move_prev_word_start" "move_next_word_end" "search_selection" "search_prev"];

          # Extend and select commands that expect a manual input can't be chained
          # I've kept d[X] commands here because it's better to at least have the stuff you want to delete
          # selected so that it's just a keystroke away to delete
          d = {
            d = ["extend_to_line_bounds" "yank_main_selection_to_clipboard" "delete_selection"];
            t = ["extend_till_char"];
            s = ["surround_delete"];
            i = ["select_textobject_inner"];
            a = ["select_textobject_around"];
            j = ["select_mode" "extend_to_line_bounds" "extend_line_below" "yank_main_selection_to_clipboard" "delete_selection" "normal_mode"];
            down = ["select_mode" "extend_to_line_bounds" "extend_line_below" "yank_main_selection_to_clipboard" "delete_selection" "normal_mode"];
            k = ["select_mode" "extend_to_line_bounds" "extend_line_above" "yank_main_selection_to_clipboard" "delete_selection" "normal_mode"];
            up = ["select_mode" "extend_to_line_bounds" "extend_line_above" "yank_main_selection_to_clipboard" "delete_selection" "normal_mode"];
            G = ["select_mode" "extend_to_line_bounds" "goto_last_line" "extend_to_line_bounds" "yank_main_selection_to_clipboard" "delete_selection" "normal_mode"];
            w = ["move_next_word_start" "yank_main_selection_to_clipboard" "delete_selection"];
            W = ["move_next_long_word_start" "yank_main_selection_to_clipboard" "delete_selection"];
            g = {
              g = ["select_mode" "extend_to_line_bounds" "goto_file_start" "extend_to_line_bounds" "yank_main_selection_to_clipboard" "delete_selection" "normal_mode"];
            };
          };

          y = {
            y = ["extend_to_line_bounds" "yank_main_selection_to_clipboard" "normal_mode" "collapse_selection"];
            j = ["select_mode" "extend_to_line_bounds" "extend_line_below" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
            down = ["select_mode" "extend_to_line_bounds" "extend_line_below" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
            k = ["select_mode" "extend_to_line_bounds" "extend_line_above" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
            up = ["select_mode" "extend_to_line_bounds" "extend_line_above" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
            G = ["select_mode" "extend_to_line_bounds" "goto_last_line" "extend_to_line_bounds" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
            w = ["move_next_word_start" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
            W = ["move_next_long_word_start" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
            g = {
              g = ["select_mode" "extend_to_line_bounds" "goto_file_start" "extend_to_line_bounds" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
            };
          };
        };
        insert = {
          # Escape the madness! No more fighting with the cursor! Or with multiple cursors!
          esc = ["collapse_selection" "normal_mode"];
        };
        select = {
          # Muscle memory
          "0" = "goto_line_start";
          "$" = "goto_line_end";
          G = "goto_file_end";
          D = ["extend_to_line_bounds" "delete_selection" "normal_mode"];
          C = ["goto_line_start" "extend_to_line_bounds" "change_selection"];
          S = "surround_add";
          u = ["switch_to_lowercase" "collapse_selection" "normal_mode"];
          U = ["switch_to_uppercase" "collapse_selection" "normal_mode"];

          # Visual-mode specific muscle memory
          i = "select_textobject_inner";
          a = "select_textobject_around";

          # Make selecting lines in visual mode behave sensibly
          k = ["extend_line_up" "extend_to_line_bounds"];
          j = ["extend_line_down" "extend_to_line_bounds"];

          # Clipboards over registers ye ye
          d = ["yank_main_selection_to_clipboard" "delete_selection"];
          x = ["yank_main_selection_to_clipboard" "delete_selection"];
          y = ["yank_main_selection_to_clipboard" "normal_mode" "flip_selections" "collapse_selection"];
          Y = ["extend_to_line_bounds" "yank_main_selection_to_clipboard" "goto_line_start" "collapse_selection" "normal_mode"];
          p = "replace_selections_with_clipboard"; # No life without this
          P = "paste_clipboard_before";

          # Escape the madness! No more fighting with the cursor! Or with multiple cursors!
          esc = ["collapse_selection" "keep_primary_selection" "normal_mode"];
        };
      };
    };
  };
}
