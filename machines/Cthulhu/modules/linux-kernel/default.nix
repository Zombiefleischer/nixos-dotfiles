{pkgs,...}:{
  # Use the latest Linux Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
    "acpi_backlight=native"
    "splash"
    # "quiet" TODO: Test, if quiet is needed
    "video4linux"
    "usbcore.autosuspend=-1"
  ];
}
