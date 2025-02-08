{pkgs, ...}: {
  services.random-background = {
    enable = true;
    display = "fill";
    enableXinerama = true;
    imageDirectory = "/home/zombiefleischer/Pictures/i3_wallpapers";
    interval = "15m";
  };

  services.picom = {
    enable = true;
    package = pkgs.picom-pijulius;
    inactiveOpacity = 0.8;
    settings = {
      "frame-opacity" = 0.8;
    };
    opacityRules = [
      "99:class_g = 'obsidian' && name *= 'Obsidian Vault'"
      "99:class_g = 'Slack'"
    ];
  };

  # TODO: swww
}
