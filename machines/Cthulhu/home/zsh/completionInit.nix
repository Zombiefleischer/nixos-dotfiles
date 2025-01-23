{
  programs.zsh.completionInit = ''
    autoload -U compinit && compinit
    autoload -U +X bashcompinit && bashcompinit
    complete -o nospace -C /etc/profiles/per-user/zombiefleischer/bin/tofu tofu
    source ~/scripts/nh-completions.zsh
    [ -f ~/.fzf.zsh ] && source ~/.fzf.sh
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
  '';
}
