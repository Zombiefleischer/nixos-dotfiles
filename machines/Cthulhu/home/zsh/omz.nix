{pkgs, ...}: {
  programs.zsh.oh-my-zsh = let
    p10k-theme = pkgs.fetchFromGitHub {
      owner = "romkatv";
      repo = "powerlevel10k";
      rev = "master";
      sha256 = "sha256-isxgLWpbBuNoETXCOlJ4nwGSxMwCjoVF5D0dMZWtM5s=";
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
      "git-auto-fetch"
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
      src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
    }
    {
      name = "nix-zsh-completions";
      src = "${pkgs.nix-zsh-completions}/share/zsh/plugins/nix";
    }
    {
      name = "you-should-use";
      src = "${pkgs.zsh-you-should-use}/share/zsh/plugins/you-should-use";
    }
    {
      name = "nix-shell";
      src = "${pkgs.zsh-nix-shell}/share/zsh-nix-shell";
    }
  ];
}
