{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation {
  pname = "libx52";
  version = "v0.3.2"; # You can set the appropriate version here

  src = pkgs.fetchFromGitHub {
    owner = "nirenjan";
    repo = "libx52";
    rev = "v0.3.2"; # You can specify a particular revision or tag here
    sha256 = "0lmf73cnv6gn86s9xk6brlnsf5zvjsyks8hkdjynlvqx8mjzfbf5"; # Update with the correct sha256
  };

  buildInputs = [
    pkgs.automake
    pkgs.autoconf
    pkgs.gettext
    pkgs.hidapi
    pkgs.libtool
    pkgs.libusb1
    pkgs.libevdev
    pkgs.pkg-config
    pkgs.python3
    pkgs.git
  ];

  nativeBuildInputs = [
    pkgs.pkg-config
  ];

  configurePhase = ''
    ./autogen.sh
    ./configure --prefix=$out --localstatedir=/var --sysconfdir=/etc
  '';

  buildPhase = ''
    make
  '';

  installPhase = ''
    make install
  '';

  meta = {
    description = "Library for interfacing with the Saitek X52 Flight Control System";
    homepage = "https://github.com/nirenjan/libx52";
    license = pkgs.lib.licenses.gpl3;
    maintainers = with pkgs.lib.maintainers; [maintainers.yourself];
  };
}
