{pkgs, ...}: {
  system.activationScripts.create-tofu-symlink = ''
    mkdir -p /usr/bin
    ln -s ${pkgs.opentofu}/bin/tofu /usr/bin/tofu
  '';
}
