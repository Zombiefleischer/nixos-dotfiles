{pkgs, ...}:{
  programs.wlogout = {
    enable = true;

    # Replace wleave with wlogout
    package = pkgs.wleave;

    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        action = "loginctl terminate-user $USER";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
  };

  catppuccin.wlogout = {
    enable = true;
    flavor = "mocha";
    accent = "sapphire";
    iconStyle = "wleave";
    extraStyle = ''
button {
  margin: 8px;
  border-style: solid;
  border-width: 2px;
}

button:active,
button:focus,
button:hover {
  color: #74c7ec;
}
    '';
  };
}
