{inputs,...}:{
  imports = [inputs.lan-mouse.homeManagerModules.default];

  programs.lan-mouse = {
    enable = true;
    systemd = true;

    settings = {
      port = 4242;

      left = {
        hostname = "Leviathan";
        activate_on_startup = true;
      };
    };
  };
}
