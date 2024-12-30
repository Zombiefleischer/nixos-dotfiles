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
      background-opacity = 0.8;
      background-blur-radius = 0;

      font-family = "FiraCode Nerd Font Ret";
      font-size = 14;
    };
  };
}
