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
    kolf
    kolourpaint
    kompare
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
    # palapeli
    plasma5support
    plasma-wayland-protocols
    qtmultimedia
    qtstyleplugin-kvantum
    qtwebsockets
    # wacomtablet
    wayland
    wayland-protocols
    xwaylandvideobridge
  ];
}
