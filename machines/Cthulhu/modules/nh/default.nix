{...}: {
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 30d";
    flake = "/home/zombiefleischer/nixos-dotfiles";
  };
  
  nix.optimise.automatic = true;
}
