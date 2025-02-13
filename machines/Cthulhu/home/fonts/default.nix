{...}: {
  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      sansSerif = ["Fira Code Nerd Font Ret" "sans-serif"];
      serif = ["Fira Code Nerd Font Ret" "serif"];
      monospace = ["Fira Code Nerd Font Ret"];
      emoji = ["noto-fonts-color-emoji"];
    };
  };
}
