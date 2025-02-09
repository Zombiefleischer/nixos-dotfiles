{pkgs, ...}: {
  programs.zsh.oh-my-zsh = let
    p10k-theme = pkgs.fetchFromGitHub {
      owner = "romkatv";
      repo = "powerlevel10k";
      rev = "master";
      sha256 = "";
    };
    customDir = pkgs.stdenv.mkDerivation {
      name = "oh-my-zsh-custom-dir";
      phases = ["buildPhase"];
      buildPhase = ''
        mkdir -p $out/themes/powerlevel10k
        cp -r ${p10k-theme}/. $out/themes/powerlevel10k/
      '';
    };
  in {
    enable = true;

    custom = "${customDir}";

    theme = "powerlevel10k/powerlevel10k";

    plugins = [
      "aliases"
      "ansible"
      "aws"
      "colored-man-pages"
      "docker"
      "eza"
      "fzf"
      "git"
      "gh"
      "golang"
      "helm"
      "history"
      "kitty"
      "kubectl"
      "kubectx"
      "nmap"
      "python"
      "ssh"
      "ssh-agent"
      "sudo"
      "systemadmin"
      "systemd"
      "terraform"
      "zoxide"
    ];

    extraConfig = ''
      zstyle :omz:plugins:ssh-agent quiet yes
      zstyle :omz:plugins:ssh-agent lazy yes
    '';
  };

  programs.zsh.plugins = [
    {
      name = "fzf-tab";
      src = pkgs.fetchFromGitHub {
        owner = "Aloxaf";
        repo = "fzf-tab";
        rev = "6aced3f35def61c5edf9d790e945e8bb4fe7b305";
        sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
      };
    }
    {
      name = "nix-zsh-completions";
      file = "${pkgs.nix-zsh-completions}/share/zsh/plugins/nix";
      src = "${pkgs.nix-zsh-completions}/share/zsh/plugins";
    }
    {
      name = "you-should-use";
      src = pkgs.fetchFromGitHub {
        owner = "MichaelAquilina";
        repo = "zsh-you-should-use";
        rev = "56616de037082f7dc0a143eb244ea27e5a697ef9";
        sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
      };
    }
    {
      name = "zsh-bat";
      src = pkgs.fetchFromGitHub {
        owner = "fdellwing";
        repo = "zsh-bat";
        rev = "467337613c1c220c0d01d69b19d2892935f43e9f";
        sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
      };
    }
    {
      name = "vi-mode";
      src = pkgs.zsh-vi-mode;
      file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
    }
  ];
}
