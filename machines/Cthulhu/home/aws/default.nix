{...}: {
  programs.awscli = {
    enable = true;
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
        ns = "namespaces";
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
          enableMouse = false;
          headless = false;
          logoless = false;
          crumbsless = false;
          reactive = false;
          noIcons = false;
        };
        skipLatestRevCheck = true;
        disablePodCounting = false;
        shellPod = {
          image = "nicolaka/netshoot:latest";
          namespace = "default";
          limits = {
            cpu = "100m";
            memory = "100Mi";
          };
        };
        featureGates = {
          nodeShell = true;
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
  };
  catppuccin.k9s = {
    enable = true;
    flavor = "mocha";
    transparent = true;
  };
}
