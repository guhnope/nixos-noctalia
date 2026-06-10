# modules/noctalia.nix
{ pkgs, inputs, ... }:

{
  # Only pull down the core desktop workspace shell binary
  environment.systemPackages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  # Core hardware daemon backends required to keep v5 modules from panic crashing
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
}
