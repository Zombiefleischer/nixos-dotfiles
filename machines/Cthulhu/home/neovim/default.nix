{
  inputs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
in {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;
    enableManpages = true;

    settings.vim = {
      withNodeJs = true;
      withPython3 = true;
      viAlias = true;
      vimAlias = true;
      useSystemClipboard = true;

      options = {
        tabstop = 2;
        shiftwidth = 2;
        relativenumber = true;
        wrap = true;
        textwidth = 0;
        wrapmargin = 0;
        linebreak = true;
        mousemoveevent = true;
        cursorline = true;
        cursorcolumn = true;
        cursorlineopt = "both";
        scrolloff = 5;
        title = true;
      };

      autocmds = [
        {
          desc = "Highlight yanked lines";
          enable = true;
          event = ["TextYankPost"];
          pattern = ["*"];
          command = "silent! lua vim.hl.on_yank {higroup='Search', timeout=300}";
        }
      ];

      keymaps = [
        {
          key = "<leader>e";
          mode = ["n"];
          action = "<cmd>Neotree toggle<cr>";
          desc = "File browser toggle";
        }
        {
          key = "<leader>w";
          mode = ["n"];
          action = ":w<CR>";
          desc = "Write file";
        }
        {
          key = "<leader>q";
          mode = ["n"];
          action = ":q<CR>";
          desc = "Quit file";
        }
        {
          key = "<leader>h";
          mode = ["n"];
          action = ":nohl<CR>";
          desc = "Clear search highlights";
        }
        {
          key = "<leader>fg";
          mode = ["n"];
          action = "<cmd>Telescope live_grep<cr>";
          desc = "Search files by contents";
        }
        {
          key = "<C-h>";
          mode = ["i"];
          action = "<Left>";
          desc = "Move left in insert mode";
        }
        {
          key = "<C-j>";
          mode = ["i"];
          action = "<Down>";
          desc = "Move down in insert mode";
        }
        {
          key = "<C-k>";
          mode = ["i"];
          action = "<Up>";
          desc = "Move up in insert mode";
        }
        {
          key = "<C-l>";
          mode = ["i"];
          action = "<Right>";
          desc = "Move right in insert mode";
        }
      ];

      binds = {
        cheatsheet.enable = true;
        whichKey.enable = true;
      };

      lsp = {
        formatOnSave = true;
        lspkind.enable = true;
        lightbulb.enable = true;
        lspsaga.enable = false;
        trouble.enable = true;
        lspSignature.enable = true;
        otter-nvim.enable = true;
        nvim-docs-view.enable = true;
        null-ls.enable = lib.mkForce false; # INFO #754
      };

      debugger = {
        nvim-dap = {
          enable = true;
          ui.enable = true;
        };
      };

      languages = {
        enableLSP = true;
        enableFormat = false; # INFO #754
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        markdown = {
          enable = true;
          extensions.render-markdown-nvim.enable = true;
          extraDiagnostics.enable = true;
          format = {
            enable = true;
            type = "prettierd";
          };
          lsp.enable = true;
          treesitter.enable = true;
        };
        bash.enable = true;
        css.enable = true;
        html.enable = true;
        sql.enable = true;
        ts.enable = true;
        go.enable = true;
        lua.enable = true;
        python.enable = true;
        terraform = {
          enable = true;
          lsp.enable = true;
          treesitter.enable = true;
        };
      };

      formatter = {
        conform-nvim = {
          enable = true;
          setupOpts = {
            format_on_save = {
              timeout_ms = 500;
              lsp_format = "fallback";
            };

            formatters_by_ft = {
              lua = ["stylua"];
              python = ["black"];
              javascript = ["prettier"];
              typescript = ["prettier"];
              javascriptreact = ["prettier"];
              typescriptreact = ["prettier"];
              css = ["prettier"];
              html = ["prettier"];
              json = ["prettier"];
              yaml = ["prettier"];
              # markdown = ["prettier"];
              nix = ["alejandra"];
              go = ["gofmt"];
              # terraform = ["tf-fmt"];
            };
          };
        };
      };

      pluginOverrides.none-ls-nvim = null; # INFO #754

      autopairs.nvim-autopairs.enable = true;

      autocomplete.nvim-cmp.enable = true;
      snippets.luasnip.enable = true;

      notes = {
        obsidian.enable = false; # Outdated
        todo-comments.enable = true;
      };

      utility = {
        ccc.enable = false;
        diffview-nvim.enable = true;
        icon-picker.enable = true;
        surround.enable = true;
        leetcode-nvim.enable = true;
        multicursors.enable = false; # Throws errors

        motion = {
          hop.enable = true;
          leap.enable = true;
          precognition.enable = true;
        };

        images = {
          image-nvim.enable = false;
        };
      };

      visuals = {
        nvim-scrollbar.enable = true;
        nvim-web-devicons.enable = true;
        nvim-cursorline.enable = true;
        cinnamon-nvim = {
          enable = false;
          setupOpts.keymaps = {
            basic = true;
            extra = true;
          };
        };
        fidget-nvim.enable = true;
        rainbow-delimiters.enable = true;

        highlight-undo.enable = true;
        indent-blankline = {
          enable = true;
          setupOpts = {
            indent = {
              char = "▏";
              highlight = [
                "RainbowDelimiterRed"
                "RainbowDelimiterYellow"
                "RainbowDelimiterBlue"
                "RainbowDelimiterOrange"
                "RainbowDelimiterGreen"
                "RainbowDelimiterViolet"
                "RainbowDelimiterCyan"
              ];
            };
            scope.char = "▎";
          };
        };

        # Fun
        cellular-automaton.enable = true;
      };

      statusline = {
        lualine = {
          enable = true;
          theme = "catppuccin";
        };
      };

      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = true;
      };

      highlight = {
        LineNr = {
          fg = "#74c7ec";
        };
        CursorLineNr = {
          fg = "#cba6f7";
        };
        CursorLine = {
          bg = "#181825";
        };
      };

      filetree = {
        neo-tree = {
          enable = true;
          setupOpts = {
            add_blank_line_at_top = true;
            filesystem = {
              follow_current_file = true;
              filtered_items = {
                visible = true;
                hide_dotfiles = false;
                hide_gitignored = false;
                never_show = [
                  ".DS_Store"
                  "thumbs.db"
                ];
              };
            };
            source_selector = {
              winbar = true;
            };
            close_if_last_window = true;
            window = {
              width = 35;
            };
            buffers = {
              follow_current_file = true;
            };
          };
        };
      };

      tabline = {
        nvimBufferline = {
          enable = true;
          setupOpts = {
            highlights = {
              separator_visible = {
                fg = "#31363b";
              };
              separator = {
                fg = "#31363b";
              };
              separator_selected = {
                fg = "#31363b";
              };
            };
            options = {
              offsets = [
                {
                  filetype = "neo-tree";
                  text = {
                    _type = "lua-inline";
                    expr = ''
                      function()
                        return vim.fn.getcwd()
                      end
                    '';
                  };
                  highlight = "Directory";
                  text_align = "center";
                }
              ];
              right_mouse_command = "bdelete! %d";
              middle_mouse_command = "vertical sbuffer %d";
              separator_style = "slant";
            };
          };
        };
      };

      treesitter = {
        context.enable = true;
      };

      telescope = {
        enable = true;
        setupOpts = {
          defaults = {
            layout_config = {
              horizontal.prompt_position = "bottom";
            };
            layout_strategy = "flex";
          };
        };
      };

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = true;
      };

      minimap = {
        minimap-vim.enable = false;
        codewindow.enable = true; # lighter, faster, and uses lua for configuration
      };

      dashboard = {
        dashboard-nvim.enable = false;
        alpha.enable = true;
      };

      notify = {
        nvim-notify = {
          enable = true;
          setupOpts.timeout = 2500;
        };
      };

      projects = {
        project-nvim.enable = true;
      };

      terminal = {
        toggleterm = {
          enable = true;
          lazygit = {
            enable = true;
            direction = "tab";
          };
        };
      };

      ui = {
        borders.enable = true;
        noice.enable = true;
        colorizer.enable = true;
        modes-nvim.enable = false; # the theme looks terrible with catppuccin
        illuminate.enable = true;
        breadcrumbs = {
          enable = true;
          navbuddy.enable = true;
        };
        smartcolumn = {
          enable = true;
          setupOpts = {
            colorcolumn = ["80" "160"];
            custom_colorcolumn = {
              nix = "110";
              ruby = "120";
              java = "130";
              go = ["90" "130"];
              markdown = ["80" "100"];
              python = ["80" "120"];
            };
            disabled_filetypes = [
              "help"
              "NvimTree"
              "NeoTree"
              "Neotree"
              "alpha"
            ];
          };
        };
        fastaction.enable = true;
      };

      comments = {
        comment-nvim.enable = true;
      };
    };
  };
}
