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
        transition = "1.0s ease";
        radius = "3px";
      };

      displayNavButtons = true;
      displayUrlbarIcons = true;

      font = {
        family = "\"FiraCode Nerd Font Ret\", \"SF Mono\", Consolas, monospace";
        accent = "#74C7EC";
      };

      icons = {
        context.firefox.enable = true;
      };
    };
  };
}
