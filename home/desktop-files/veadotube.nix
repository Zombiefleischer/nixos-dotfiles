{...}: {
  xdg.desktopEntries.veadotube = {
    name = "Veadotube Mini";
    genericName = "Veadotube";
    comment = "PNG Tuber";
    exec = "steam-run $HOME/Documents/VeadoTube/veadotube_mini";
    icon = "app.bluebubbles.BlueBubbles";
    terminal = "false";
    type = "Application";
    categories = ["AudioVideo" "Video" "Graphics"];
    mimeType = ["application/veadotube"];
  };
}
