{inputs, ...}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;

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
        mousemoveevent = true;
      };

      keymaps = [
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
          key = "<leader>e";
          mode = ["n"];
          action = "<cmd>Neotree toggle<cr>";
          desc = "File browser toggle";
        }
        {
          key = "<leader>st";
          mode = ["n"];
          action = "<cmd>Telescope live_grep<cr>";
          desc = "Search files by contents";
        }
      ];

      binds = {
        cheatsheet.enable = true;

        whichKey = {
          enable = true;

          register = {
            "<leader>w" = "<cmd>w<cr>";
            "<leader>q" = "<cmd>q<cr>";
          };
        };
      };

      lsp = {
        formatOnSave = true;
        lspkind.enable = true;
        lightbulb.enable = true;
        lspsaga.enable = false;
        trouble.enable = true;
        lspSignature.enable = true;
        otter-nvim.enable = true;
        lsplines.enable = true;
        nvim-docs-view.enable = true;
      };

      debugger = {
        nvim-dap = {
          enable = true;
          ui.enable = true;
        };
      };

      languages = {
        enableLSP = true;
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        markdown.enable = true;
        bash.enable = true;
        css.enable = true;
        html.enable = true;
        sql.enable = true;
        ts.enable = true;
        go.enable = true;
        lua.enable = true;
        python.enable = true;
      };

      autopairs.nvim-autopairs.enable = true;

      autocomplete.nvim-cmp.enable = true;
      snippets.luasnip.enable = true;

      notes = {
        obsidian.enable = true;
        todo-comments.enable = true;
      };

      utility = {
        ccc.enable = false;
        diffview-nvim.enable = true;
        icon-picker.enable = true;
        surround.enable = true;
        leetcode-nvim.enable = true;
        multicursors.enable = true;

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
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;

        highlight-undo.enable = true;
        indent-blankline.enable = true;

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

      filetree = {
        neo-tree = {
          enable = true;
        };
      };

      tabline = {
        nvimBufferline.enable = true;
      };

      treesitter.context.enable = true;

      telescope.enable = true;

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
        nvim-notify.enable = true;
      };

      projects = {
        project-nvim.enable = true;
      };

      terminal = {
        toggleterm = {
          enable = true;
          lazygit.enable = true;
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
          setupOpts.custom_colorcolumn = {
            nix = "110";
            ruby = "120";
            java = "130";
            go = ["90" "130"];
            markdown = ["80" "100"];
            python = ["80" "120"];
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
