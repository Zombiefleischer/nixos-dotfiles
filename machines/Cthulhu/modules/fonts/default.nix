{pkgs,...}:{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.hack
      nerd-fonts.fira-code
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      corefonts
    ];
    fontDir.enable = true;
    fontconfig = {
      useEmbeddedBitmaps = true;
      defaultFonts = {
        serif = ["Noto Serif" "serif"];
        sansSerif = ["Noto Sans" "sans-serif"];
        monospace = ["FiraCode Nerd Font Ret"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
