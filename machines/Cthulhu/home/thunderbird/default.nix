_: {
  programs.thunderbird = {
    enable = true;
    profiles."oj7hxw00.default-default" = {
      isDefault = true;
    };
  };

  catppuccin.thunderbird = {
    accent = "sapphire";
    enable = true;
    flavor = "mocha";
    profile = "oj7hxw00.default-default";
  };
}
