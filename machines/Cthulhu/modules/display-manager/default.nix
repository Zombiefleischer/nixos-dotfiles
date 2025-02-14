{pkgs, ...}: {
  # Enable Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --theme 'border=magenta;text=cyan;prompt=green;time=cyan;action=blue;button=yellow;container=black;input=red' --time --time-format '%H:%M | %a • %h | 1%F' --cmd Hyprland";
        user = "greeter";
      };
    };
  };
}
