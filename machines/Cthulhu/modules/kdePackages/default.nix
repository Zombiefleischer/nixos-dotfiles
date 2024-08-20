{pkgs, ...}: {
  environment.systemPackages = with pkgs.kdePackages; [
    discover
    dolphin-plugins
    kbackup
    kcalc
    kde-gtk-config
    kjournald
    kmines
    kmousetool
    kmouth
    knotes
    kolf
    kolourpaint
    konquest
    krdc
    krfb
    kruler
    kspaceduel
    ksshaskpass
    ksystemlog
    kwallet
    kwallet-pam
    kwalletmanager
    plasma-wayland-protocols
    qtmultimedia
    qtstyleplugin-kvantum
    qtwebsockets
    wayland
    wayland-protocols
    xdg-desktop-portal-kde
  ];
}
