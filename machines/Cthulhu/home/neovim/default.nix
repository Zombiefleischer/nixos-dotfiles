{inputs, ...}: {
  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
  };

  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    # General Configuration
    ./settings.nix
    ./file_types.nix

    # Themes
    ./plugins/themes/default.nix

    # Completion

    # Snippets

    # Editor plugins and configurations

    # UI plugins

    # LSP and formatting

    # Git

    # Utils
  ];
}
