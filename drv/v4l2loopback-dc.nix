{
  stdenv,
  lib,
  fetchFromGitHub,
  kernel,
  ...
}:
stdenv.mkDerivation rec {
  name = "v4l2loopback-dc";
  version = "2.1.3";

  src = fetchFromGitHub {
    owner = "dev47apps";
    repo = "droidcam-linux-client";
    rev = "v${version}";
    sha256 = "Pwq7PDj+MH1wzrUyfva2F2+oELm4Sb1EJPUUCsHYb7k=";
  };

  sourceRoot = "source/v4l2loopback";
  hardeningDisable = ["pic" "format"];
  nativeBuildInputs = kernel.moduleBuildDependencies;

  preBuild = ''
    substituteInPlace Makefile \
    --replace "width=320 height=240" "width=1920 height=1080"
  '';

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
