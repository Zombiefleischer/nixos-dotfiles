{...}: {
  programs.git = {
    # TODO: configure more options
    enable = true;
    delta = {
      enable = true;
      options = {
        dark = true;
        line-numbers = true;
        side-by-side = true;
      };
    };
  };
  catppuccin.delta = {
    enable = true;
    flavor = "mocha";
  };
}
