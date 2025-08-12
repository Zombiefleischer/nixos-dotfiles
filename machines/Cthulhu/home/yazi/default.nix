_: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      mgr = {
        show_hidden = true;
        show_symlink = true;
      };
    };
  };
}
