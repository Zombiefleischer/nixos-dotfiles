{...}: {
  services.mpd = {
    enable = true;
    musicDirectory = /home/zombiefleischer/Zombiecloud/Musik;
  };

  services.mpd-mpris = {
    enable = true;
  };

  services.mpd-discord-rpc = {
    enable = true;
  };

  programs.ncmpcpp = {
    enable = true;
  };
}
