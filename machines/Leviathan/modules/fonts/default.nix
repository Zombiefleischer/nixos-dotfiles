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
    enableDefaultPackages = true;
    fontDir.enable = true;
    fontconfig.defaultFonts = {
      serif = ["Noto Serif" "serif"];
      sansSerif = ["Noto Sans" "sans-serif"];
      monospace = ["FiraCode Nerd Font Ret"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
