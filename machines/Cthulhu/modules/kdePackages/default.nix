{pkgs, ...}: {
  environment.systemPackages = with pkgs.kdePackages; [
    discover
    dolphin-plugins
    # karousel
    kbackup
    kcalc
    kde-gtk-config
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
    plasma-wayland-protocols
    qtmultimedia
    qtstyleplugin-kvantum
    qtwayland
    qtwebsockets
    wayland
    wayland-protocols
  ];
}
