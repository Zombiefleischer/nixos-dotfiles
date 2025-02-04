{...}: {
  programs.zsh.syntaxHighlighting = {
    enable = true;
    highlighters = ["brackets"];
  };

  catppuccin.zsh-syntax-highlighting = {
    enable = true;
    flavor = "mocha";
  };
}
