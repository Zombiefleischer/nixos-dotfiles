{
  description = "Zombiefleischers personal NixOS config flake";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    lan-mouse = {
      url = "github:feschber/lan-mouse";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    textfox.url = "github:adriankarlen/textfox";

    calibrePlugins.url = "git+https://codeberg.org/Nydragon/calibre-plugins.git";
  };

  outputs = {
    self,
    catppuccin,
    envfs,
    home-manager,
    hyprland,
    hyprland-plugins,
    lan-mouse,
    nix-flatpak,
    nixpkgs,
    nvf,
    zen-browser,
    calibrePlugins,
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
        # ./machines/Leviathan/drv/k3b.nix # Burn CDs
        # ./machines/Leviathan/drv/klassy.nix
        # ./machines/Leviathan/drv/wallpaper-engine-kde.nix
        ./machines/Leviathan/modules/flatpak
        ./machines/Leviathan/modules/bindfs
        ./machines/Leviathan/modules/firefox-addons
        ./machines/Leviathan/modules/fonts
        ./machines/Leviathan/modules/keychron
        ./machines/Leviathan/modules/nh
        ./machines/Leviathan/modules/nix
        ./machines/Leviathan/modules/openrgb
        ./machines/Leviathan/modules/simracing
        ./machines/Leviathan/modules/steam
        ./machines/Leviathan/modules/time_i18n
        ./machines/Leviathan/modules/variables
        ./machines/Leviathan/modules/wireguard

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
              imports = [
                ./machines/Leviathan/home
                catppuccin.homeModules.catppuccin
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
        ./machines/Cthulhu/modules/droidcam
        ./machines/Cthulhu/modules/flatpak
        ./machines/Cthulhu/modules/fonts
        ./machines/Cthulhu/modules/hyprland
        ./machines/Cthulhu/modules/kde-plasma
        ./machines/Cthulhu/modules/linux-kernel
        ./machines/Cthulhu/modules/nh
        ./machines/Cthulhu/modules/nix-settings
        ./machines/Cthulhu/modules/nixpkgs
        ./machines/Cthulhu/modules/screen
        ./machines/Cthulhu/modules/sound
        ./machines/Cthulhu/modules/ssh
        ./machines/Cthulhu/modules/time_i18n
        ./machines/Cthulhu/modules/tlp
        ./machines/Cthulhu/modules/usb
        ./machines/Cthulhu/modules/variables
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
              ];
            };
            backupFileExtension = "hm.bak";
          };
        }
      ];
    };
  };
}
