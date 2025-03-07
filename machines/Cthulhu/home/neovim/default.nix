{inputs, ...}: {
  imports = [
    inputs.nvf.homeManagerModules.default

    # LSP and formatting
    ./lsp.nix

    # Visuals and Theme
    ./visuals.nix

    # Binds
    ./binds.nix

    # Utility
    ./utility.nix

    # Notes
    ./notes.nix
  ];

  programs.nvf = {
    enable = true;
  };
}
