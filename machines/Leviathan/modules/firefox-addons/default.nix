{pkgs, ...}: {
  # Enable Firefox Plasma Browser Integration
  programs.firefox.nativeMessagingHosts.packages = with pkgs; [
    plasma-browser-integration
  ];
}
