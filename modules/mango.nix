{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.mango.nixosModules.mango
  ];
  programs.mango = {
    addLoginEntry = true;
  };
  xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
  };
  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    GTK_THEME = "adw-gtk3-dark";
    NIXOS_OZONE_WL = "1";
  };
}
