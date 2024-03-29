{pkgs, ...}: {
  environment.systemPackages = with pkgs.kdePackages; [
    kde-gtk-config
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
