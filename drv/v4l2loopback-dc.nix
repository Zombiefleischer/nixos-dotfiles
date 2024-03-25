{
  stdenv,
  lib,
  fetchFromGitHub,
  kernel,
  ...
}:
stdenv.mkDerivation rec {
  name = "v4l2loopback-dc";
  version = "2.1.2";

  src = fetchFromGitHub {
    owner = "dev47apps";
    repo = "droidcam";
    rev = "v${version}";
    sha256 = "NZ6sKLE/Sq4VBJSf7iG0CgdVwmU8JXQH/utbobBEFi0=";
  };

  sourceRoot = "source/v4l2loopback";
  hardeningDisable = ["pic" "format"];
  nativeBuildInputs = kernel.moduleBuildDependencies;

  makeFlags = [
    "KERNELRELEASE=${kernel.modDirVersion}"
    "KERNEL_DIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "INSTALL_MOD_PATH=$(out)"
  ];

  meta = with lib; {
    description = "A kernel module to create V4L2 loopback devices";
    homepage = "https://github.com/dev47apps/droidcam";
    license = licenses.gpl2;
    maintainers = [maintainers.makefu];
    platforms = platforms.linux;
  };
}
