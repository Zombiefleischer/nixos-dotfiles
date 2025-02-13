{
  programs.zsh.sessionVariables = {
    # Path to your oh-my-zsh installation.
    ZSH = "$HOME/.oh-my-zsh";

    GOPATH = "$HOME/go";
    PATH = "$PATH:$GOPATH/bin";

    # configure mtr to ncurses display with stripchart
    MTR_OPTIONS = "-t --displaymode 2";

    # You-Should-Use
    YSU_MODE = "ALL";
    YSU_MESSAGE_FORMAT = ''$(tput bold)$(tput setaf 4) Found existing %alias_type for $(tput setaf 1)\"%command\"$(tput setaf 4). You should use: $(tput setaf 6)\"%alias\"$(tput sgr0)'';
    YSU_MESSAGE_POSITION = "after";

    # Variable for fx json colored output
    FX_THEME = 2;

    # Style bat
    BAT_STYLE = "auto";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";

    # Auto update omz
    UPDATE_ZSH_DAYS = 30;

    # AWS
    AWS_DEFAULT_REGION = "eu-central-1";

    # Tofu access token to nb boring registry
    TF_CLI_CONFIG_FILE = "~/tofu.tfrc";

    # Setting Battery Thresholds
    START_CHARGE_THRESH_BAT0 = 70;
    STOP_CHARGE_THRESH_BAT0 = 80;

    # Autoquoter
    ZAQ_PREFIXES = "('git commit( [^ ]##)# -[^ -]#m' 'ssh( [^ ]##)# [^ -][^ ]#')";

    # Remove ansible cows
    ANSIBLE_NOCOWS = 1;

    # Change ansible output
    ANSIBLE_STDOUT_CALLBACK = "yaml";

    #
  };
}
