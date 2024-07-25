{pkgs, ...}: {
  pkgs.floorp.overrideAttrs = old: {
    name = "floorp-cleaned";

    buildCommand =
      /*
      bash
      */
      ''
        set -euo pipefail

        set -x
        cp -rs --no-preserve=mode "${pkgs.floorp.out}" "$out"
        set +x

        rm -R $out/lib/firefox
        rm -R $out/lib/mozilla
      '';
  };
}
