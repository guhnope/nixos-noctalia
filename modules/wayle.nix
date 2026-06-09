# modules/wayle.nix
{ pkgs, lib, config, ... }:

{
  options.programs.wayle.enable = lib.mkEnableOption "Wayle Desktop Bar Ecosystem";

  config = lib.mkIf config.programs.wayle.enable {
    environment.systemPackages = with pkgs; [
      wayle
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
