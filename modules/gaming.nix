{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    extest.enable = true;
  };

  environment.systemPackages = with pkgs; [
    protontricks
    heroic
    gamescope
    mangohud
    ];
}
