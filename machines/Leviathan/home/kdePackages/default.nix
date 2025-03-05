{pkgs, ...}: {
  home.packages = with pkgs.kdePackages; [
    discover
    dolphin-plugins
    filelight
    kate
    kbackup
    kcalc
    kde-gtk-config
    kdenlive
    kdialog
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
    partitionmanager
    plasma5support
    plasma-browser-integration
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
