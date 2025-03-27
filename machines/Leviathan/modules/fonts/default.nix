{pkgs, ...}: let
  PentimentFonts = pkgs.runCommand "pentiment-fonts" {buildInputs = [pkgs.fontconfig];} ''
    mkdir -p $out/share/fonts
    cp ${./Pentiment}/* $out/share/fonts/
  '';
  ElectricPanda = pkgs.runCommand "electric-panda" {buildInputs = [pkgs.fontconfig];} ''
    mkdir -p $out/share/fonts
    cp ${./ElectricPanda}/* $out/share/fonts/
  '';
in {
  fonts = {
    packages = with pkgs; [
      nerd-fonts.symbols-only
      nerd-fonts.hack
      nerd-fonts.fira-code
      fira-code
      hack-font
      dejavu_fonts # default
      freefont_ttf # default
      gyre-fonts # default
      liberation_ttf # default
      unifont # default
      noto-fonts
      noto-fonts-emoji
      noto-fonts-color-emoji # default
      noto-fonts-cjk-sans
      PentimentFonts
      ElectricPanda
    ];
    enableDefaultPackages = false;
    fontDir.enable = true;
    fontconfig.defaultFonts = {
      monospace = ["FiraCode Nerd Font"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
