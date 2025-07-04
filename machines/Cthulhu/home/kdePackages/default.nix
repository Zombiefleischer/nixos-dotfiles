{pkgs, ...}: {
  home.packages = with pkgs.kdePackages; [
    ark
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
    konsole
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
    okular
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
