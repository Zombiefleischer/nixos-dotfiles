{...}: {
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 30d --keep 15";
    flake = "/home/zombiefleischer/nixos-dotfiles";
  };
}
