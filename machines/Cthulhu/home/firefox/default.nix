{inputs,...}: {
  imports = [
     inputs.textfox.homeManagerModules.default
  ];

  programs.firefox = {
    enable = true;
  };

  textfox = {
    enable = true;
    profile = "rlpepp97.default-esr";
    config = {
      background = {  
        color = "#1E1E2E";
      };

      border = {
        color = "#313244";
        transition = "0.2s ease";
        radius = "8px";
      };

      displayNavButtons = true;
      displayUrlbarIcons = true;

      font = {
        family = "\"FiraCode Nerd Font Ret\", \"SF Mono\", Consolas, monospace";
        accent = "#74C7EC";
      };

      icons = {
        # Icons for context items
        context.firefox.enable = true;

        # Monochrome Icons
        toolbar.extensions.enable = true;
        context.extensions.enable = true;
      };
    };
  };
}
