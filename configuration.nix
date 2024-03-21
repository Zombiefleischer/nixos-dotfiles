# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Leviathan"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.nameservers = ["192.168.178.34"];

  # Set up ports
  # barrier
  networking.firewall.allowedTCPPorts = [24800];

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Set graphics drivers
  services.xserver.videoDrivers = ["nvidia"];

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "intl";
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
  sound.enable = true;
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
  services.udev.packages = [pkgs.goxlr-utility];
  xdg.autostart.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zombiefleischer = {
    isNormalUser = true;
    description = "Zombiefleischer";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      firefox
      kate
      nextcloud-client
      oh-my-zsh
      plasma-browser-integration
      signal-desktop
      telegram-desktop
      thunderbird
      tidal-hifi
      vivaldi
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    (
      makeAutostartItem
      {
        name = "goxlr-utility";
        package = goxlr-utility;
      }
    )
    alejandra
    (
      makeAutostartItem
      {
        name = "barrier";
        package = barrier;
      }
    )
    bat
    btop
    catppuccin
    catppuccin-kvantum
    catppuccin-papirus-folders
    doas
    eza
    fzf
    git
    gparted
    helix
    junction
    lazygit
    libnotify
    neofetch
    neovim
    partition-manager
    tldr
    unzip
    usbtop
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    zoxide
    zsh
  ];

  # Enable xone for Xbox Controller
  hardware.xone.enable = true;

  # Install fonts
  fonts.packages = with pkgs; [
    hackgen-nf-font
  ];
  fonts.fontDir.enable = true;
  fonts.fontconfig.defaultFonts.monospace = ["HackGen35 Console NF"];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.zsh.enable = true;
  programs.kdeconnect.enable = true;

  # Enable zsh for all users
  users.defaultUserShell = pkgs.zsh;

  # Enable doas as an alternative to sudo
  security.doas.enable = true;
  security.doas.extraRules = [
    {
      users = ["zombiefleischer"];
      keepEnv = true;
      noPass = true;
    }
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";
  programs.ssh.startAgent = true;

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
