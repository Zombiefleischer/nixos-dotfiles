_: {
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "/home/zombiefleischer/nixos-dotfiles/machines/Leviathan/home/omp/config.json"));
  };
}
