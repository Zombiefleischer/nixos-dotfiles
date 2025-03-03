{...}: let
  system = "x86_64-linux";
  nix-alien-pkgs = import (
    builtins.fetchTarball {
      url = "https://github.com/thiagokokada/nix-alien/tarball/master";
      sha256 = "072f72beccee5c3d4545bb3624b48a18d2d82ccd2740f8361098179884d94ecc";
    }
  ) {};
in {
  environment.systemPackages = with nix-alien-pkgs; [
    nix-alien
  ];

  # Optional, but this is needed for `nix-alien-ld` command
  programs.nix-ld.enable = true;
}
