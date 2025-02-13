{inputs, ...}: {
  imports = [inputs.lan-mouse.homeManagerModules.default];

  programs.lan-mouse = {
    enable = true;
    systemd = true;

    settings = {
      port = 4242;
      authorized_fingerprints = {
        "cf:1b:dd:73:db:5d:a9:87:ce:0e:02:60:c4:f7:99:77:95:69:7d:27:ce:66:d6:c6:a6:9a:5b:f7:31:c9:f8:d4" = "Cthulhu";
      };
    };
  };
}
