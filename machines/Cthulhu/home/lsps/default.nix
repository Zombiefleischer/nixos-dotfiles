{pkgs, ...}: {
  home.packages = [
    # Ansible
    pkgs.ansible-language-server
    pkgs.ansible-lint

    # Nix
    pkgs.alejandra
    pkgs.nil

    # YAML / JSON
    pkgs.nodePackages.yaml-language-server

    # Typescript & Javascript
    pkgs.nodePackages.typescript-language-server

    # TMate
    pkgs.tmate
  ];
}
