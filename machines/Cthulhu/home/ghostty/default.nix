{...}: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    installBatSyntax = true;
    installVimSyntax = true;

    settings = {
      background-opacity = 0.85;
      background-blur = false;

      font-size = 14;
      font-family = "Monaspace Neon Frozen";
      font-family-bold = "Monaspace Xenon Frozen";
      font-family-italic = "Monaspace Radon Frozen";
      font-family-bold-italic = "Monaspace Krypton Frozen";
      # Test font styles
      font-style = "Medium";
      font-style-bold = "Italic";
      font-style-italic = "Italic";
      font-style-bold-italic = "Regular";

      theme = "catppuccin-mocha";

      window-theme = "ghostty";
      # window-decoration = true;

      gtk-titlebar = false;
      gtk-tabs-location = "bottom";
      gtk-wide-tabs = false;
      gtk-single-instance = true;

      copy-on-select = "clipboard";

      cursor-style = "block";

      shell-integration-features = "cursor,sudo,title";
    };
  };
}
