{nixified-ai, ...}: {
  imports = [nixified-ai.nixosModules.invokeai-nvidia];

  services.invokeai = {
    enable = true;
  };
}
