{
  description = "Zombiefleischers personal NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    catppuccin.url = "github:catppuccin/nix";

    envfs = {
      url = "github:Mic92/envfs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:MarceColl/zen-browser-flake";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.3.0";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-alien.url = "github:thiagokokada/nix-alien";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    catppuccin,
    envfs,
    home-manager,
    nix-alien,
    nix-flatpak,
    nixpkgs,
    nixvim,
    ...
  } @ inputs: let
    system = "x86_64-linux";
  in {
    # Leviathan
    nixosConfigurations.Leviathan = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs self system;};
      modules = [
        ./machines/Leviathan/configuration.nix # plasma6/Wayland
        # ./drv/libx52.nix # not working atm
        # ./machines/Leviathan/drv/klassy.nix
        ./machines/Leviathan/drv/wallpaper-engine-kde.nix
        ./machines/Leviathan/modules/flatpak
        ./machines/Leviathan/modules/bindfs
        ./machines/Leviathan/modules/firefox-addons
        ./machines/Leviathan/modules/fonts
        ./machines/Leviathan/modules/kdePackages
        ./machines/Leviathan/modules/keychron
        ./machines/Leviathan/modules/nh
        ./machines/Leviathan/modules/openrgb
        ./machines/Leviathan/modules/steam
        ./machines/Leviathan/modules/time_i18n
        ./machines/Leviathan/modules/variables

        catppuccin.nixosModules.catppuccin
        envfs.nixosModules.envfs
        nix-flatpak.nixosModules.nix-flatpak
        home-manager.nixosModules.home-manager
        ({
          self,
          system,
          ...
        }: {
          environment.systemPackages = with self.inputs.nix-alien.packages.${system}; [
            nix-alien
          ];
          programs.nix-ld.enable = true;
        })
        {
          home-manager = {
            # useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs system;};
            users."zombiefleischer" = {
              imports = [
                ./machines/Leviathan/home
                catppuccin.homeManagerModules.catppuccin
              ];
            };
            backupFileExtension = "hm.bak";
          };
        }
      ];
    };

    # Cthulhu
    nixosConfigurations.Cthulhu = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs system;};
      modules = [
        ./machines/Cthulhu/configuration.nix
        ./machines/Cthulhu/modules/bindfs
        ./machines/Cthulhu/modules/flatpak
        ./machines/Cthulhu/modules/kdePackages
        ./machines/Cthulhu/modules/nh
        ./machines/Cthulhu/modules/time_i18n

        catppuccin.nixosModules.catppuccin
        envfs.nixosModules.envfs
        nix-flatpak.nixosModules.nix-flatpak
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs system;};
            users."zombiefleischer" = {
              imports = [
                ./machines/Cthulhu/home
                catppuccin.homeManagerModules.catppuccin
              ];
            };
            backupFileExtension = "hm.bak";
          };
        }
      ];
    };
  };
}
