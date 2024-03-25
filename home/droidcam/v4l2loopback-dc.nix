{ stdenv, lib, fetchFromGitHub, kernel, kmod, pkgs }:

stdenv.mkDerivation rec {
  name = "v4l2loopback-dc-${version}-${kernel.version}";
  version = "2.1.2";

  src = fetchFromGitHub {
    owner = "dev47apps";
    repo = "droidcam";
    rev = "v${version}";
    sha256 = "d650513327d69f0a359120e66aa7e9b462a9b341c2176df296fb560b45bff43f";
  };

  sourceRoot = "source/linux/v4l2loopback";
  hardeningDisable = [ "pic" "format" ];
  nativeBuildInputs = kernel.moduleBuildDependencies;

  makeFlags = [
    "KERNELRELEASE=${kernel.modDirVersion}"
    "KERNEL_DIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "INSTALL_MOD_PATH=$(out)"
];

  meta = with lib; {
    description = "A kernel module to create V4L2 loopback devices";
    homepage = "https://github.com/aramg/droidcam";
    license = licenses.gpl2;
    maintainers = [ maintainers.makefu ];
    platforms = platforms.linux;
  };
}

