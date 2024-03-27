_: {
  programs.firefox = {
    enable = true;
    policies = {
      DisablePocket = true;
      DontCheckDefaultBrowser = true;
      ExtensionUpdate = true;
      HardwareAcceleration = true;
      OfferToSaveLoginsDefault = false;
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;
      Proxy = {
        Mode = "none";
      };
      RequestedLocales = ["de" "en-US"];
      SearchBar = "unified";
      SearchEngines = {
        Remove = ["Google" "Bing"];
      };
    };
  };
}
