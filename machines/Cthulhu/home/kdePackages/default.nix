{pkgs, ...}: {
  home.packages = with pkgs.kdePackages; [
    discover
    dolphin-plugins
    # karousel
    kate
    kbackup
    kcalc
    kde-gtk-config
    kdialog
    kjournald
    kmines
    kmousetool
    kmouth
    # knotes
    kolf
    kolourpaint
    konquest
    krdc
    krfb
    # krohnkite
    kruler
    kspaceduel
    ksshaskpass
    ksystemlog
    kwallet
    kwallet-pam
    kwalletmanager
    kzones
    plasma-browser-integration
    plasma-wayland-protocols
    qtmultimedia
    qtstyleplugin-kvantum
    qtwayland
    qtwebsockets
    wayland
    wayland-protocols
  ];
}
