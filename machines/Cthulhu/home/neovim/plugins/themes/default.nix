{
  programs.nixvim = {
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        background = {
          light = "macchiato";
          dark = "mocha";
        };
        custom_highlights = ''
          function(highlights)
            return {
              CursorLineNr = { fg = highlights.sapphire, style = {} },
              NavicText = { fg - highlights.text },
            }
          end
        '';
        flavour = "mocha";
        no_bold = false;
        no_italic = false;
        no_underline = false;
        integrations = {
          cmp = true;
          notify = true;
          gitsigns = true;
          neotree = true;
          which_key = true;
          illuminate = {
            enabled = true;
            lsp = true;
          };
          navic = {
            enabled = true;
            custom_bg = "NONE";
          };
          treesitter = true;
          telescope.enabled = true;
          indent_blankline.enabled = true;
          mini = {
            enabled = true;
            indentscope_color = "sapphire";
          };
          native_lsp = {
            enabled = true;
            inlay_hints = {
              background = true;
            };
            virtual_text = {
              errors = ["italic"];
              hints = ["italic"];
              information = ["italic"];
              warnings = ["italic"];
              ok = ["italic"];
            };
            underlines = {
              errors = ["underlines"];
              hints = ["underlines"];
              information = ["underlines"];
              warnings = ["underlines"];
            };
          };
        };
        transparent_background = true;
      };
    };
  };
}
