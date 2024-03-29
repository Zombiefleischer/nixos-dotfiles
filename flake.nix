{
  description = "Zombiefleischers personal NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    catppuccin.url = "github:Stonks3141/ctp-nix";

    envfs = {
      url = "github:Mic92/envfs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.3.0";

    helix-master = {
      url = "github:SoraTenshi/helix/new-daily-driver";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    catppuccin,
    envfs,
    home-manager,
    nix-flatpak,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.Leviathan = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs system;};
      modules = [
        ./configuration.nix # plasma6/Wayland
        ./drv/wallpaper-engine-kde.nix
        ./home/flatpak
        ./modules/bindfs
        ./modules/firefox-addons
        ./modules/kdePackages
        ./modules/steam
        ./modules/time_i18n
        ./modules/variables
        catppuccin.nixosModules.catppuccin
        envfs.nixosModules.envfs
        nix-flatpak.nixosModules.nix-flatpak
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            # useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs system;};
            users."zombiefleischer" = {
              imports = [./home];
            };
          };
        }
      ];
    };
  };
}
