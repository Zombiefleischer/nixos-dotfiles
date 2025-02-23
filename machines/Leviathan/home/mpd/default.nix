{...}: {
  services.mpd = {
    enable = true;
    musicDirectory = /home/zombiefleischer/Zombiecloud/Musik;
    network.startWhenNeeded = true;
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
    # TODO: Configure Controls, Album Covers
  };

  # TODO: Configure ListenBrainz for music metadata

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
