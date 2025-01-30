_: {
  imports = [
    ./aliases.nix
    ./autosuggestion.nix
    ./completionInit.nix
    ./history.nix
    ./omz.nix
    ./sessionVariable.nix
    ./syntaxHighlighting.nix
    ./zshrc.nix
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    defaultKeymap = "vicmd";
  };

  home.file.".p10k.zsh".text = builtins.readFile ./p10k.zsh;
  home.file.".zsh/functions.zsh".text = builtins.readFile ./functions.zsh;

  home.file.".config/zsh/icons" = {
    source = "./icons";
    recursive = true;
  };
}
