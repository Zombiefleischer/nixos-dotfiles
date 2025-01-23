{...}:{

  # USB Automounting
  services.gvfs.enable = true;

  # Enable USB Guard
  services.usbguard = {
    enable = true;
    dbus.enable = true;
    implicitPolicyTarget = "block";
    # set your pref USB devices (change {id} to your trusted USB device), use `lsusb` command (from usbutils package) to get list of all connected USB devices including integrated devices like camera, bluetooth, wifi, etc. with their IDs or just disable `usbguard`
    rules = ''
      allow id 1d6b:0002 # Linux Foundation 2.0 root hub
      allow id 1d6b:0003 # Linux Foundation 3.0 root hub
      allow id 17ef:a391 # Lenovo USB3.1 Hub
      allow id 17ef:a392 # Lenovo USB2.0 Hub
      allow id 17ef:a393 # Lenovo USB3.1 Hub
      allow id 17ef:a394 # Lenovo USB2.0 Hub
      allow id 17ef:a395 # Lenovo USB2.0 Hub
      allow id 17ef:a396 # Lenovo ThinkPad USB-C Dock Gen2 USB Audio
      allow id 17ef:a387 # Lenovo USB-C Dock Ethernet
      allow id 17ef:a38f # Lenovo 40AS
      allow id 2c2c:0127 # Quectel Wireless Solutions Co., Ltd. Quectel EM05-CE
      allow id 06cb:00bd # Synaptics, Inc. Prometheus MIS Touch Fingerprint Reader
      allow id 13d3:5406 # IMC Networks Integrated Camera
      allow id 058f:9540 # Alcor Micro Corp. AU9540 Smartcard Reader
      allow id 8087:0026 # Intel Corp. AX201 Bluetooth
      allow id 3297:1969 # ZSA Technology Labs Moonlander Mark I
      allow id 046d:c08d # Logitech, Inc. G502 LIGHTSPEED Wireless Gaming Mouse
      allow id 1050:0407 # Yubico.com Yubikey 4/5 OTP+U2F+CCID
    '';
  };
}
