{
  programs.zsh.completionInit = ''
    autoload -U compinit && compinit
    autoload -U +X bashcompinit && bashcompinit
    complete -o nospace -C /etc/profiles/per-user/zombiefleischer/bin/tofu tofu
    source ~/scripts/nh-completions.zsh
  '';
}
