{
  config,
  pkgs,
  ...
}: let
  PentimentFonts = pkgs.runCommand "pentiment-fonts" {buildInputs = [pkgs.fontconfig];} ''
    mkdir -p $out/share/fonts
    cp ${./Pentiment}/* $out/share/fonts/
  '';
in {
  fonts.packages = with pkgs; [
    PentimentFonts
  ];
}
# TODO: Add other fonts in here

