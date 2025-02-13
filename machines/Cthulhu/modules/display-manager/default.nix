{pkgs, ...}: {
  # Enable Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%H:%M | %a • %h | 1%F' --cmd Hyprland";
        user = "greeter";
      };
    };
  };
}
