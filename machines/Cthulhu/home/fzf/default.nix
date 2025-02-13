{...}: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  catppuccin.fzf = {
    enable = true;
    flavor = "mocha";
    accent = "sapphire";
  };
}
