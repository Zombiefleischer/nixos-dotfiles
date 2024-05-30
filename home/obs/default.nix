{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-backgroundremoval
      obs-composite-blur
      obs-pipewire-audio-capture
      obs-shaderfilter
      obs-vintage-filter
      # wlrobs
    ];
  };
}
