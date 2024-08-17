{...}: {
  programs.lazygit = {
    enable = true;

    settings = {
      git = {
        commit.signOff = true;
        parseEmoji = true;
        paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never";
        };
      };
      gui = {
        authorColors = {
          "Max Schönleben" = "#00dded";
          "Max Schoenleben" = "#00dded";
          "Zombiefleischer" = "#00dded";
        };
        theme = {
          activeBorderColor = ["#74c7ec" "bold"];
          inactiveBorderColor = ["#a6adc8"];
          optionsTextColor = ["#89b4fa"];
          selectedLineBgColor = ["#313244"];
          cherryPickedCommitBgColor = ["#45475a"];
          cherryPickedCommitFgColor = ["#74c7ec"];
          unstagedChangesColor = ["#f38ba8"];
          defaultFgColor = ["#cdd6f4"];
          searchingActiveBorderColor = ["#f9e2af"];
        };
        nerdFontsVersion = "3";
        commandLogSize = 15;
        showBottomLine = true;
      };
      promptToReturnFromSubprocess = true; # false @ work
      services = {
        "git.nextbike.net" = "gitlab:git.nextbike.net";
      };
    };
  };
}
