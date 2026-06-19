{ pkgs, config, lib, ... }:

let
  # Determine if either compositor is enabled
  isSway = config.programs.sway.enable;
  isScroll = config.programs.scroll.enable; # Assuming you add this module
in
{
  config = lib.mkIf (isSway || isScroll) {
    # These tools are universal to both Sway and Scroll
    environment.systemPackages = with pkgs; [
      swayidle
      swaylock
      swaybg
      swayimg
      swayosd
    ];

    # Portals are universal
    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common.default = lib.mkDefault [ "gtk" ];
    };

    # Variables work for both
    environment.sessionVariables = {
      QT_QPA_PLATFORMTHEME = "qt6ct";
      GTK_THEME = "adw-gtk3-dark";
      NIXOS_OZONE_WL = "1";
    };
  };
}
