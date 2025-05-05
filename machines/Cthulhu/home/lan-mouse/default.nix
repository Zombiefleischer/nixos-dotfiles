{inputs, ...}: {
  imports = [inputs.lan-mouse.homeManagerModules.default];

  programs.lan-mouse = {
    enable = true;
    systemd = true;

    settings = {
      port = 4242;

      clients = [
        {
          position = "left";
          hostname = "Leviathan";
          activate_on_startup = true;
          ips = ["192.168.178.71" "192.168.178.79"];
        }
      ];
    };
  };
}
