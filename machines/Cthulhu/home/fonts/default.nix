{...}: {
  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      sansSerif = ["Noto Sans" "sans-serif"];
      serif = ["Noto Serif" "serif"];
      monospace = ["Monaspace Neon Frozen"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
