{
  config,
  pkgs,
  ...
}: let
  PentimentFonts = pkgs.runCommand "pentiment-fonts" {buildInputs = [pkgs.fontconfig];} ''
    mkdir -p $out/share/fonts
    cp ${./Pentiment}/* $out/share/fonts/
  '';
  ElectricPanda = pkgs.runCommand "electric-panda" {buildInputs = [pkgs.fontconfig];} ''
    mkdir -p $out/share/fonts
    cp ${./ElectricPanda}/* $out/share/fonts/
  '';
in {
  fonts.packages = with pkgs; [
    PentimentFonts
    ElectricPanda
  ];
}
# TODO: Add other fonts in here

