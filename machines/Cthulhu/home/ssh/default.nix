{lib, ...}: {
  # home.file.".ssh/config".text = builtins.readFile ./config;

  # home.file.".ssh/config" = {
  #   source = config.lib.file.mkOutOfStoreSymlink ./config;
  # };

  home.activation.mySSHConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
    run cp $HOME/nixos-dotfiles/machines/Cthulhu/home/ssh/config $HOME/.ssh/config
  '';
}
