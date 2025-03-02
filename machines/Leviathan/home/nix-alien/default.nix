{...}: let
  nix-alien-pkgs = import (
    builtins.fetchTarball {
      url = "https://github.com/thiagokokada/nix-alien/tarball/master";
      sha256 = "AAAAAAAAAAA";
    }
  ) {};
in {
  # ...
  home.packages = with nix-alien-pkgs; [
    nix-alien
  ];
}
