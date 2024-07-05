{
  lib,
  stdenv,
  fetchFromGitHub,
  automake,
  autoconf,
  gettext,
  hidapi,
  libtool,
  libusb1,
  libevdev,
  pkg-config,
  python3,
  git,
}:
stdenv.mkDerivation rec {
  pname = "libx52";
  version = "0.3.2"; # You can set the appropriate version here

  src = fetchFromGitHub {
    owner = "nirenjan";
    repo = "libx52";
    rev = "v${version}";
    sha256 = "0lmf73cnv6gn86s9xk6brlnsf5zvjsyks8hkdjynlvqx8mjzfbf5"; # Update with the correct sha256
  };

  nativeBuildInputs = [automake autoconf libtool pkg-config python3 gettext git];
  buildInputs = [libusb1 hidapi libevdev];

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

  meta = with lib; {
    description = "Library for interfacing with the Saitek X52 Flight Control System";
    homepage = "https://github.com/nirenjan/libx52";
    license = pkgs.lib.licenses.gpl3;
    maintainers = with pkgs.lib.maintainers; [maintainers.yourself];
  };
}
