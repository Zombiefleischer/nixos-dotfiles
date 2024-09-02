{self, ...}: {
  imports = [];

  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        integrations = {
          cmp = true;
          gitsigns = true;
          nvimtree = true;
          treesitter = true;
          notify = true;
          mini.enabled = true;
        };
        transparent_background = true;
      };
    };

    defaultEditor = true;
    vimdiffAlias = true;
  };
}
