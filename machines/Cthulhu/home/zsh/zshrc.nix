{
  programs.zsh = {
    # Extra local variables defined at the top of .zshrc.
    localVariables = {
      # Uncomment the following line to use case-sensitive completion.
      # CASE_SENSITIVE = true;

      # Uncomment the following line to use hyphen-insensitive completion.
      # Case-sensitive completion must be off. _ and - will be interchangeable.
      HYPHEN_INSENSITIVE = true;

      # Uncomment the following line to disable colors in ls.
      DISABLE_LS_COLORS = true;

      # Uncomment the following line to disable auto-setting terminal title.
      # DISABLE_AUTO_TITLE = true;

      # Uncomment the following line to enable command auto-correction.
      ENABLE_CORRECTION = true;

      # Uncomment the following line to display red dots whilst waiting for completion.
      # You can also set it to another string to have that shown instead of the default red dots.
      # e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
      # Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
      COMPLETION_WAITING_DOTS = true;

      # Uncomment the following line if you want to disable marking untracked files
      # under VCS as dirty. This makes repository status check for large repositories
      # much, much faster.
      # DISABLE_UNTRACKED_FILES_DIRTY = true;
      
      # Uncomment the following line if you want to change the command execution time
      # stamp shown in the history command output.
      # You can set one of the optional three formats:
      # "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
      # or set a custom format using the strftime function format specifications,
      # see 'man strftime' for details.
      HIST_STAMPS = "yyyy-mm-dd";

      # Update settings
      ZSH_CUSTOM_AUTOUPDATE_QUIET=true;
      ZSH_CUSTOM_AUTOUPDATE_NUM_WORKERS=8;
    };

    # Commands that should be added to top of .zshrc.
    initExtraFirst = 
    /* bash */
    ''
      # Enable Powerlevel 10k instant prompt. Should stay close to the top of ~/.zshrc.
      # Initialization code that may require console input (password prompts, [y/n]
      # confirmations, etc.) must go above this block; everything else may go below.
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi

      use_color=true
    '';

    # Commands that should be added to .zshrc before compinit.
    initExtraBeforeCompInit = '''';

    # Commands that should be added to .zshrc.
    initExtra = 
    /* bash */
    ''
      source ~/.zsh/functions.zsh
      source ~/.zsh/jira.zsh
      [ -f ~/.fzf.zsh ] && source ~/.fzf.sh
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };
}
