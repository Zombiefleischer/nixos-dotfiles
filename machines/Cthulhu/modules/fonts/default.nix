{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      nerd-fonts.hack
      nerd-fonts.fira-code
      nerd-fonts.monaspace
      monaspace
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
        monospace = ["Monaspace Neon Frozen"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
