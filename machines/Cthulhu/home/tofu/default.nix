{pkgs, ...}: {
  system.activationScripts.create-tofu-symlink = ''
    mkdir -p /usr/bin
    ln -s ${pkgs.tofu}/bin/tofu /usr/bin/tofu
  '';
}
