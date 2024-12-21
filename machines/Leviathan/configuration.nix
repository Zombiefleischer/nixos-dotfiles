# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nix.settings.trusted-substituters = ["https://ai.cachix.org"];
  nix.settings.trusted-public-keys = ["ai.cachix.org-1:N9dzRK+alWwoKXQlnn0H6aUx0lU/mspIoz8hMvGvbbc="];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use the latest Linux Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "Leviathan"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.nameservers = ["192.168.178.34"];

  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Set up ports
  networking.firewall.allowedTCPPorts = [
    5900 # krfb-virtualmonitor
    24800 # input-leap
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Set graphics drivers
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = true;
    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.production;
  };
  boot.kernelParams = ["nvidia.NVreg_PreserveVideoMemoryAllocations=1"];

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasmax11";
  programs.xwayland.enable = true;

  # Enable Hyprland
  programs.hyprland.enable = false;

  # Enable i3
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      dmenu
      i3status
      i3lock
    ];
  };

  # Configure console keymap
  console.keyMap = "us-acentos";

  fileSystems."/home/zombiefleischer/Zombiecloud" = {
    device = "/dev/disk/by-uuid/46187b7b-75c5-48bb-aa0d-6b0e94f9f2fa";
    fsType = "ext4";
    options = [
      "users"
      "nofail"
      "x-gvfs-show"
    ];
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable goxlr-utility
  services.udev.packages = [pkgs.goxlr-utility pkgs.zsa-udev-rules];
  xdg.autostart.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zombiefleischer = {
    isNormalUser = true;
    description = "Zombiefleischer";
    extraGroups = ["networkmanager" "wheel" "docker" "plugdev" "cdrom"];
  };

  # Enable passwordless sudo
  security.sudo.extraRules = [
    {
      users = ["zombiefleischer"];
      commands = [
        {
          command = "ALL";
          options = ["NOPASSWD" "SETENV"];
        }
      ];
    }
  ];

  # Activate protonmail bridge
  systemd.user.services.protonmail-bridge = {
    description = "Protonmail Bridge";
    enable = true;
    script = "${pkgs.protonmail-bridge}/bin/protonmail-bridge --noninteractive --log-level info";
    wantedBy = ["graphical-session.target"];
    partOf = ["graphical-session.target"];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable docker virtualisation
  virtualisation.docker.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${system}".specific
  ];

  # Enable xone for Xbox Controller
  hardware.xone.enable = true;
  hardware.xpadneo.enable = true;

  # Enable QMK access
  hardware.keyboard.qmk.enable = true;

  # Enable Tablet Drivers
  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

  # Stuff for flatpak and wayland
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.kdePackages.xdg-desktop-portal-kde
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal
    ];
    wlr.enable = true;
  };

  # Install fonts
  fonts = {
    packages = with pkgs; [
      nerd-fonts.hack
      nerd-fonts.fira-code
      dejavu_fonts # default
      freefont_ttf # default
      gyre-fonts # default
      liberation_ttf # default
      unifont # default
      noto-fonts
      noto-fonts-emoji
      noto-fonts-color-emoji # default
      noto-fonts-cjk-sans
    ];
    enableDefaultPackages = false;
    fontDir.enable = true;
    fontconfig.defaultFonts.monospace = ["FiraCode Nerd Font"];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.zsh.enable = true;
  programs.kdeconnect.enable = true;
  # programs.k3b.enable = true;

  # Enable zsh for all users
  users.defaultUserShell = pkgs.zsh;

  ## List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";
  programs.ssh = {
    startAgent = true;
    extraConfig = ''
      AddKeysToAgent yes
      IdentityFile ~/.ssh/zombiehacker.ed25519
    '';
  };

  # Enable KWallet
  security.pam.services.zombiefleischer.enableKwallet = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
