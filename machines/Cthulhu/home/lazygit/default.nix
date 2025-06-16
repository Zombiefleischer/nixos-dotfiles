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
      promptToReturnFromSubprocess = false;
      services = {
        "git.nextbike.net" = "gitlab:git.nextbike.net";
      };
      customCommands = [
        {
          key = "G";
          command = "glab mr view -w {{.SelectedLocalBranch.UpstreamBranch}}";
          context = "localBranches";
          description = "Go to MR in gitlab";
          output = "log";
        }
        {
          key = "M";
          command = "git mergetool {{ .SelectedFile.Name }}";
          context = "files";
          loadingText = "opening git mergetool";
          description = "Use git mergetool";
          output = "terminal";
        }
        {
          key = "b";
          command = "git branch --merged master | grep -v '^[ *]*master$' | xargs -r git branch -d";
          context = "localBranches";
          loadingText = "Pruning...";
          description = "prune local branches that have been merged to master";
        }
        {
          key = "<c-p>";
          command = ''git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done";'';
          context = "localBranches";
          description = "Prune local branches no longer on its remote";
          loadingText = "Pruning gone...";
        }
        {
          key = "<c-f>";
          description = "fetch a remote branch as a new local branch";
          command = "git fetch {{index .SelectedRemote.Name }} {{index .PromptResponses 0}}:{{index .PromptResponses 1}}";
          context = "remotes";
          prompts = [
            {
              type = "input";
              title = "Remote Branch Name";
              initialValue = "";
            }
            {
              type = "input";
              title = "New Local Branch Name";
              initialValue = "";
            }
          ];
          loadingText = "fetching branch";
        }
        {
          key = "<c-v>";
          context = "global";
          description = "Create new conventional commit";
          prompts = [
            {
              type = "menu";
              key = "Type";
              title = "Type of change";
              options = [
                {
                  name = "build";
                  description = "Changes that affect the build system or external dependencies";
                  value = "build";
                }
                {
                  name = "feat";
                  description = "A new feature";
                  value = "feat";
                }
                {
                  name = "fix";
                  description = "A bug fix";
                  value = "fix";
                }
                {
                  name = "chore";
                  description = "Other changes that don't modify src or test files";
                  value = "chore";
                }
                {
                  name = "ci";
                  description = "Changes to CI configuration files and scripts";
                  value = "ci";
                }
                {
                  name = "docs";
                  description = "Documentation only changes";
                  value = "docs";
                }
                {
                  name = "perf";
                  description = "A code change that improves performance";
                  value = "perf";
                }
                {
                  name = "refactor";
                  description = "A code change that neither fixes a bug nor adds a feature";
                  value = "refactor";
                }
                {
                  name = "revert";
                  description = "Reverts a previous commit";
                  value = "revert";
                }
                {
                  name = "style";
                  description = "Changes that do not affect the meaning of the code";
                  value = "style";
                }
                {
                  name = "test";
                  description = "Adding missing tests or correcting existing tests";
                  value = "test";
                }
              ];
            }
            {
              type = "input";
              title = "Scope";
              key = "Scope";
              initialValue = "";
            }
            {
              type = "menu";
              key = "Breaking";
              title = "Breaking change";
              options = [
                {
                  name = "no";
                  value = "";
                }
                {
                  name = "yes";
                  value = "!";
                }
              ];
            }
            {
              type = "input";
              title = "message";
              key = "Message";
              initialValue = "";
            }
            {
              type = "confirm";
              key = "Confirm";
              title = "Commit";
              body = "Are you sure you want to commit?";
            }
          ];
          command = "git commit --message '{{.Form.Type}}{{ if .Form.Scope }}({{ .Form.Scope }}){{ end }}{{.Form.Breaking}}: {{.Form.Message}}'";
          loadingText = "Creating conventional commit...";
        }
      ];
    };
  };
}
