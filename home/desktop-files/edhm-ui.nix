{...}: {
  xdg.desktopEntries.edhm-ui = {
    name = "EDHM UI";
    comment = "E:D HUD Mod UI";
    exec = "env WINEDEBUG='-all' WINEPREFIX='/home/zombiefleischer/.wine_edhmui' '/home/zombiefleischer/.wine_edhmui/drive_c/users/zombiefleischer/AppData/Local/EDHM_UI/EDHM_UI_mk2.exe'";
    icon = "/home/zombiefleischer/.wine_edhmui/logo.png";
    terminal = "false";
    type = "Application";
    categories = ["Game"];
  };
}
