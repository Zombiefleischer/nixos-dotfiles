{pkgs, ...}: {
  environment.systemPackages = with pkgs.kdePackages; [
    kwallet
    kwallet-pam
    kwalletmanager
    ksshaskpass
    qtstyleplugin-kvantum
    wayland
    wayland-protocols
    xdg-desktop-portal-kde
  ];
}
