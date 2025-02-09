{
  description = "Zombiefleischers personal NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    catppuccin.url = "github:catppuccin/nix";

    envfs = {
      url = "github:Mic92/envfs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-alien.url = "github:thiagokokada/nix-alien";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
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
    zen-browser,
    ...
  } @ inputs: let
    system = "x86_64-linux";

    systemSpecificOverlays = [
      (final: prev: {
        banana-cursor-dreams = prev.callPackage ./machines/Leviathan/drv/banana-cursor.nix {};
      })
    ];
  in {
    # Leviathan
    nixosConfigurations.Leviathan = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs self system;};
      modules = [
        ./machines/Leviathan/configuration.nix # plasma6/Wayland
        # ./drv/libx52.nix # not working atm
        # ./machines/Leviathan/drv/k3b.nix # Burn CDs
        # ./machines/Leviathan/drv/klassy.nix
        # ./machines/Leviathan/drv/wallpaper-engine-kde.nix
        ./machines/Leviathan/modules/flatpak
        ./machines/Leviathan/modules/bindfs
        ./machines/Leviathan/modules/firefox-addons
        ./machines/Leviathan/modules/fonts
        ./machines/Leviathan/modules/kdePackages
        ./machines/Leviathan/modules/keychron
        ./machines/Leviathan/modules/nh
        ./machines/Leviathan/modules/openrgb
        ./machines/Leviathan/modules/simracing
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
          nixpkgs.overlays = systemSpecificOverlays;
        }

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
        ./machines/Cthulhu/modules/bootloader
        ./machines/Cthulhu/modules/display-manager
        ./machines/Cthulhu/modules/flatpak
        ./machines/Cthulhu/modules/hyprland
        ./machines/Cthulhu/modules/kde-plasma
        ./machines/Cthulhu/modules/kdePackages
        ./machines/Cthulhu/modules/linux-kernel
        ./machines/Cthulhu/modules/nh
        ./machines/Cthulhu/modules/nix-settings
        ./machines/Cthulhu/modules/nixpkgs
        ./machines/Cthulhu/modules/screen
        ./machines/Cthulhu/modules/sound
        ./machines/Cthulhu/modules/ssh
        ./machines/Cthulhu/modules/time_i18n
        ./machines/Cthulhu/modules/usb
        ./machines/Cthulhu/modules/virtualisation
        ./machines/Cthulhu/modules/yubikey

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
