{
  inputs,
  system,
  ...
}: {
  programs.ghostty = {
    enable = true;
    package = inputs.ghostty-package.packages.${system}.default;
    shellIntegration = {
      enable = true;
      enableZshIntegration = true;
    };

    settings = {
      background-opacity = 0.75;
      background-blur-radius = 0;

      font-family = "FiraCode Nerd Font Ret";
      font-size = 14;

      theme = "catppuccin-macchiato";

      window-theme = "dark";
      window-decoration = false;
    };
  };
}
