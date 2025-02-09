{pkgs, ...}: {
  services.random-background = {
    enable = true;
    display = "fill";
    enableXinerama = true;
    imageDirectory = "/home/zombiefleischer/Pictures/i3_wallpapers";
    interval = "15m";
  };

  home.file."scripts/swww_randomize_multi.sh".text = builtins.readFile ./swww_randomize_multi.sh;
}
