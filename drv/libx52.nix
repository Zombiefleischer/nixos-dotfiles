{
  stdenv,
  fetchFromGitHub,
  automake,
  autoconf,
  autopoint,
  gettext,
  hidapi,
  libtool,
  libusb1,
  libevdev,
  pkg-config,
  python3,
}:
stdenv.mkDerivation rec {
  pname = "libx52";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "nirenjan";
    repo = "libx52";
    rev = "master";
    sha256 = "0wvh5s4g5gn4nxlrbf5sq5p7spygkfj6mri2z7w1vjhx2vrbm2ja";
  };

  nativeBuildInputs = [automake autoconf autopoint gettext libtool pkg-config python3];
  buildInputs = [hidapi libusb1 libevdev];

  preConfigure = ''
    ./autogen.sh
  '';

  configureFlags = [
    "--prefix=/usr"
    "--localstatedir=/var"
    "--sysconfdir=/etc"
  ];

  meta = with stdenv.lib; {
    description = "Driver for the Saitek X52 and X52 Pro HOTAS Joystick.";
    homepage = "https://github.com/nirenjan/libx52";
    license = licenses.gpl2;
    maintainers = [maintainers.yourself];
  };
}
