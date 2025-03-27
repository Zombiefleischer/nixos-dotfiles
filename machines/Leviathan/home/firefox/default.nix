{inputs, ...}: {
  imports = [
    inputs.textfox.homeManagerModules.default
  ];

  programs.firefox = {
    enable = true;
  };

  textfox = {
    enable = true;
    profile = "jexgc3s4.default-release";
    config = {
      background = {
        color = "#24273A";
      };

      border = {
        color = "#363A4F";
        transition = "0.2s ease";
        radius = "8px";
      };

      displayNavButtons = true;
      displayUrlbarIcons = true;
      displayWindowControls = true;

      font = {
        family = "\"FiraCode Nerd Font Ret\", \"SF Mono\", Consolas, monospace";
        accent = "#7DC4E4";
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
