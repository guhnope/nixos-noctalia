{ inputs, ... }:

{
  # 1. Import the official module from your flake input
  imports = [
    inputs.noctalia-greeter.nixosModules.default
  ];

  # 2. Enable and configure it using their module settings
  programs.noctalia-greeter = {
    enable = true;
  };
}
