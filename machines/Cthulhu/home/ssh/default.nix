_: {
  home.file.".ssh/config".text = builtins.readFile ./config;
}
