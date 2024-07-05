{
  lib,
  stdenv,
  fetchurl,
  automake,
  autoconf,
  gettext,
  hidapi,
  libtool,
  libusb1,
  libevdev,
  pkg-config,
  python3,
  doxygen,
  cmocka,
  git,
}:
stdenv.mkDerivation rec {
  pname = "libx52";
  version = "0.3.2";
  src = fetchurl {
    url = "https://github.com/nirenjan/libx52/releases/download/v${version}/${pname}_${version}.orig.tar.gz";
    sha256 = "c4d4cdce7f2fce85871f3b1a4bf0f8122eb2969e62ee0d381984c9d26e0a8e25";
  };

  nativeBuildInputs = [automake autoconf libtool pkg-config python3 gettext doxygen cmocka git];
  buildInputs = [hidapi libusb1 libevdev];

  configurePhase = ''
    cd ${src}/build
    ../configure --prefix=$out --localstatedir=/var --sysconfdir=/etc --disable-silent-rules --disable-maintainer-mode
  '';

  buildPhase = "make";

  installPhase = ''
    make install DESTDIR=$out
    rmdir $out/var/run
    rmdir $out/var/log
  '';

  meta = with lib; {
    description = "Driver for the Saitek X52 and X52 Pro HOTAS Joystick.";
    homepage = "https://github.com/nirenjan/libx52";
    license = licenses.gpl2;
    maintainers = [maintainers.yourself];
  };
}
