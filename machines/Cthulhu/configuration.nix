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

  networking.hostName = "Cthulhu"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
    trusted-users = ["root" "@wheel"];
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.nameservers = ["192.168.178.34"];

  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Enable i3
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      dmenu
      i3status
      i3lock
      rofi
    ];
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
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

  services.udev.packages = [pkgs.zsa-udev-rules];

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zombiefleischer = {
    isNormalUser = true;
    description = "Max Schönleben";
    extraGroups = ["networkmanager" "wheel" "docker" "plugdev"];
  };
  users.users.root.openssh.authorizedKeys.keys = config.users.users.zombiefleischer.openssh.authorizedKeys.keys;

  # Enable passwordless sudo
  security.sudo.wheelNeedsPassword = false;
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

  # Install firefox.
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  # ];
  environment.pathsToLink = ["/share/zsh"];

  # Stuff for flatpak and wayland
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.kdePackages.xdg-desktop-portal-kde pkgs.xdg-desktop-portal];
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
      corefonts
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
  programs.neovim.defaultEditor = true;
  programs.light.enable = true;
  programs.direnv.enable = true;

  # Enable zsh for all users
  users.defaultUserShell = pkgs.zsh;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";
  programs.ssh = {
    startAgent = true;
    extraConfig = ''
      AddKeysToAgent yes
      IdentityFile ~/.ssh/mschoenleben_nextbike.ed25519
    '';
  };

  # Enable KWallet
  security.pam.services.zombiefleischer.enableKwallet = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    22 # ssh
    5900 # krfb-virtualmonitor
    24800 # input-leap
  ];
  networking.firewall.allowedUDPPorts = [
    4242 # lan-mouse
  ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
