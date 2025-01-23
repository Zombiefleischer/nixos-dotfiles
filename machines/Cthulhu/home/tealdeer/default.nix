{...}:{

  programs.tealdeer = {
    enable = true;
    settings = {
      updates = {
        auto_update = true;
        auto_update_interval_hours = 720;
      };

      display = {
        compact = false;
        use_pager = false;
      };

      style = {
        description = {
          underline = false;
          bold = false;
          italic = true;
        };

        command_name = {
          foreground = "cyan";
          underline = false;
          bold = false;
          italic = false;
        };

        example_text = {
          foreground = "green";
          underline = false;
          bold = false;
          italic = false;
        };

        example_code = {
          foreground = "yellow";
          underline = false;
          bold = false;
          italic = true;
        };

        example_variable = {
          foreground = "blue";
          underline = false;
          bold = true;
          italic = false;
        };
      };
    };
  };
}
