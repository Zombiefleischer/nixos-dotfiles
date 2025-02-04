{...}: {
  services.dunst = {
    enable = true;

    catppuccin = {
      enable = true;
      flavor = "mocha";
    };

    settings = {
      global = {
        separator_color = "frame";
        font = "FiraCode Nerd Font Ret 10pt";
        corner_radius = 10;
        offset = "5x5";
        origin = "top-right";
        notification_limit = 8;
        gap_size = 7;
        frame_width = 2;
        width = 300;
        height = 100;
      };
    };
  };
}
