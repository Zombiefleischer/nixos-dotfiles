{ pkgs, ... }:
{
  home.packages = [
    # Nix
    pkgs.alejandra
    pkgs.nil

    # YAML / JSON
    pkgs.nodePackages.yaml-language-server

    # Typescript & Javascript
    pkgs.nodePackages.typescript-language-server
  ];
}
