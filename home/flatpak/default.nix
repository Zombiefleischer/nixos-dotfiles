_: {
  services.flatpak = {
    enable = true;
    update.auto.enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];

    packages = [
      {
        appId = "io.github.diegopvlk.Dosage";
        origin = "flathub";
      }
    ];
  };
}
