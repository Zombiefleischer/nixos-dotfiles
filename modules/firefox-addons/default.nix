{pkgs, ...}: {
  # Enable Firefox Plasma Browser Integration
  nixpkgs.config.firefox.enablePlasmaBrowserIntegration = true;

  programs.firefox.nativeMessagingHosts.packages = with pkgs; [
    plasma-browser-integration
  ];
}
