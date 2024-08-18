{pkgs, ...}: {
  home.file.".config/tofu-bin".text = ''
    #! /bin/sh
    exec ${pkgs.opentofu}/bin/tofu "$@"
  '';

  home.activation.init = ''
    chmod +x $HOME/.config/tofu-bin
    ln -sf $HOME/.config/tofu-bin $HOME/bin/tofu
  '';
}
