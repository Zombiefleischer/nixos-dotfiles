{pkgs, ...}: {
  environment.systemPackages = with pkgs.kdePackages; [
    discover
    dolphin-plugins
    filelight
    kbackup
    kcalc
    kde-gtk-config
    kdenlive
    kjournald
    kmines
    kmousetool
    kmouth
    # knotes
    kolf
    kolourpaint
    # kompare
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
    palapeli
    plasma5support
    plasma-wayland-protocols
    qtmultimedia
    qtstyleplugin-kvantum
    qtwebsockets
    wayland
    wayland-protocols
    xdg-desktop-portal-kde
  ];
}
