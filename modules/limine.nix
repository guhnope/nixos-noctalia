{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = false;
  boot.loader.limine = {
    enable = true;
    enrollConfig = true;               # Generates the modern Limine menu definitions
    panicOnChecksumMismatch = true;    # Adds a security layer against corrupted builds
    maxGenerations = 10;               # Prevents your ESP partition from running out of space
  };
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader.efi.canTouchEfiVariables = true;
}
