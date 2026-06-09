# modules/waybar.nix
{ pkgs, lib, config, ... }:

{
  options.programs.waybar.enable = lib.mkEnableOption "waybar Desktop Bar Ecosystem";

  config = lib.mkIf config.programs.waybar.enable {
    environment.systemPackages = with pkgs; [
      waybar
      wofi
      wlogout
      matugen
      grim
      slurp
      sway-contrib.grimshot
      hyprpolkitagent
    ];
  };
}
