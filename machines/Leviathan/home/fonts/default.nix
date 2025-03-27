{...}: {
  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      sansSerif = ["Noto Sans" "sans-serif"];
      serif = ["Noto Serif" "serif"];
      monospace = ["Fira Code Nerd Font Ret"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
