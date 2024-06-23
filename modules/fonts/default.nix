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
  fonts.fonts = with pkgs; [
    PentimentFonts
  ];
}
