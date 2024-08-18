{...}: {
  programs.awscli = {
    enable = false;
  };
  programs.k9s = {
    enable = true;
    aliases = {
      aliases = {
        dp = "deloyments";
        sec = "v1/secrets";
        jo = "jobs";
        cr = "clusterroles";
        crb = "clusterrolebindings";
        ro = "roles";
        rb = "rolebindings";
        np = "networkpolicies";
      };
    };
    settings = {
      k9s = {
        liveViewAutoRefresh = true;
        screenDumpDir = "/home/zombiefleischer/.local/state/k9s/sceen-dumps";
        refreshRate = 2;
        maxConnRetry = 5;
        readOnly = false;
        noExitOnCtrlC = false;
        ui = {
          enableMouse = true;
          headless = false;
          logoless = false;
          crumbsless = false;
          reactive = false;
          noIcons = false;
          skin = "catppuccin-mocha-transparent";
        };
        skipLatestRevCheck = true;
        disablePodCounting = false;
        shellPod = {
          image = "busybox:1.35.0";
          namespace = "default";
          limits = {
            cpu = "100m";
            memory = "100Mi";
          };
        };
        imageScans = {
          enable = false;
          exclusions = {
            namespace = [];
            labels = {};
          };
        };
        logger = {
          tail = 100;
          buffer = 5000;
          sinceSeconds = -1;
          fullScreen = false;
          textWrap = true;
          showTime = false;
        };
        thresholds = {
          cpu = {
            critical = 90;
            warn = 70;
          };
          memory = {
            critical = 90;
            warn = 70;
          };
        };
      };
    };
    skins = {
      catppuccin-mocha-transparent = {
        k9s = {
          body = {
            fgColor = "#cdd6f4";
            bgColor = "default";
            logoColor = "#cba6f7";
          };
          prompt = {
            fgColor = "#cdd6f4";
            bgColor = "default";
            suggestColor = "#89b4fa";
          };
          help = {
            fgColor = "#cdd6f4";
            bgColor = "default";
            sectionColor = "#a6e3a1";
            keyColor = "#89b4fa";
            numKeyColor = "#eba0ac";
          };
          frame = {
            title = {
              fgColor = "#94e2d5";
              bgColor = "default";
              highlightColor = "#f5c2e7";
              counterColor = "#f9e2af";
              filterColor = "#a6e3a1";
            };
            border = {
              fgColor = "#cba6f7";
              focusColor = "#b4befe";
            };
            menu = {
              fgColor = "#cdd6f4";
              keyColor = "#89b4fa";
              numKeyColor = "#eba0ac";
            };
            crumbs = {
              fgColor = "#1e1e2e";
              bgColor = "default";
              activeColor = "#f2cdcd";
            };
            status = {
              newColor = "#89b4fa";
              modifyColor = "#b4befe";
              addColor = "#a6e3a1";
              pendingColor = "#fab387";
              errorColor = "#f38ba8";
              highlightColor = "#89dceb";
              killColor = "#cba6f7";
              completedColor = "#6c7086";
            };
          };
          info = {
            fgColor = "#fab387";
            sectionColor = "#cdd6f4";
          };
          views = {
            table = {
              fgColor = "#cdd6f4";
              bgColor = "default";
              cursorFgColor = "#313244";
              cursorBgColor = "#45475a";
              markColor = "#f5e0dc";
              header = {
                fgColor = "#f9e2af";
                bgColor = "default";
                sorterColor = "#89dceb";
              };
            };
            xray = {
              fgColor = "#cdd6f4";
              bgColor = "default";
              cursorColor = "#45475a";
              cursorTextColor = "#1e1e2e";
              graphicColor = "#f5c2e7";
            };
            charts = {
              bgColor = "default";
              chartBgColor = "default";
              dialBgColor = "default";
              defaultDialColors = ["#a6e3a1" "#f38ba8"];
              defaultChartColors = ["#a6e3a1" "#f38ba8"];
              resourceColors = {
                cpu = ["#cba6f7" "#89b4fa"];
                mem = ["#f9e2af" "#fab387"];
              };
            };
            yaml = {
              keyColor = "#89b4fa";
              valueColor = "#cdd6f4";
              colonColor = "#a6adc8";
            };
            logs = {
              fgColor = "#cdd6f4";
              bgColor = "default";
              indicator = {
                fgColor = "#b4befe";
                bgColor = "default";
                toggleOnColor = "#a6e3a1";
                toggleOffColor = "#a6adc8";
              };
            };
          };
          dialog = {
            fgColor = "#f9e2af";
            bgColor = "default";
            buttonFgColor = "#1e1e2e";
            buttonBgColor = "default";
            buttonFocusFgColor = "#1e1e2e";
            buttonFocusBgColor = "#f5c2e7";
            labelFgColor = "#f5e0dc";
            fieldFgColor = "#cdd6f4";
          };
        };
      };
    };
  };
}
