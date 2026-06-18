{ pkgs, config, lib, ... }:

{
  config = lib.mkIf config.programs.sway.enable {
    programs.sway.extraPackages = [
      swayidle
      swaylock
      swaytools
      swaybg
      swayimg
      swayosd
    ];

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common.default = lib.mkDefault [ "gtk" ];
    };

    environment.sessionVariables = {
      QT_QPA_PLATFORMTHEME = "qt6ct";
      GTK_THEME = "adw-gtk3-dark";
      NIXOS_OZONE_WL = "1";
    };
  };
}
