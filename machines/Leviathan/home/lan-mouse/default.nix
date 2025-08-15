{inputs, ...}: {
  imports = [inputs.lan-mouse.homeManagerModules.default];

  programs.lan-mouse = {
    enable = true;
    systemd = true;

    settings = {
      authorized_fingerprints = {
        "b4:5e:69:16:8c:6d:61:b9:78:8c:f3:e1:38:0c:3c:19:c3:e7:ce:44:83:ad:2c:7a:b6:f8:3b:d2:78:be:01:da" = "Cthulhu";
      };
    };
  };
}
