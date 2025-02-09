{pkgs, ...}: {
  programs = {
    git = {
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

    gh = {
      enable = true;

      extensions = [
        pkgs.gh-eco
        pkgs.gh-s
        pkgs.gh-i
        pkgs.gh-f
        pkgs.gh-cal
        pkgs.gh-notify
        pkgs.gh-screensaver
        pkgs.gh-contribs
      ];

      settings = {
        git_protocol = "ssh";
        editor = "nvim";
        prompt = "enabled";
        browser = "firefox";
      };
    };

    gh-dash = {
      enable = true;

      catppuccin = {
        enable = true;
        accent = "sapphire";
        flavor = "mocha";
      };

      settings = {
        pager = {
          diff = "delta";
        };
      };
    };
  };
}
