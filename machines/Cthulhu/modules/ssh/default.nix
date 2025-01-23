{config,...}:{
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
      AllowUsers = ["zombiefleischer"];
    };
  };
  
  programs.ssh = {
    startAgent = true;
    extraConfig = ''
      AddKeysToAgent yes
      IdentityFile ~/.ssh/mschoenleben_nextbike.ed25519
    '';
  };

  users.users.root.openssh.authorizedKeys.keys = config.users.users.zombiefleischer.openssh.authorizedKeys.keys;
}
