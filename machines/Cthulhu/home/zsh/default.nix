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

  home.file.".config/zsh/icons/" = {
    source = ./icons;
    recursive = true;
  };

  home.language = {
    base = "en_GB.UTF-8";
    address = "de_DE.UTF-8";
    collate = "de_DE.UTF-8";
    ctype = "de_DE.UTF-8";
    measurement = "de_DE.UTF-8";
    messages = "en_GB.UTF-8";
    monetary = "de_DE.UTF-8";
    name = "de_DE.UTF-8";
    numeric = "en_GB.UTF-8";
    paper = "de_DE.UTF-8";
    telephone = "de_DE.UTF-8";
    time = "en_SE.UTF-8";
  };
}
