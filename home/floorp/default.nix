{pkgs ? import <nixpkgs> {}, ...}: let
  pkg = pkgs.floorp;
in
  pkg.overrideAttrs (old: {
    name = "floorp-cleaned";

    buildCommand =
      /*
      bash
      */
      ''
        set -euo pipefail

        set -x
        cp -rs --no-preserve=mode "${pkg.out}" "$out"
        set +x

        rm -R $out/lib/firefox
        rm -R $out/lib/mozilla
      '';
  })
