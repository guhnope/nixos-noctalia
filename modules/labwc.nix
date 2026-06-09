# modules/labwc.nix
{ pkgs, ... }:

{

  # Essential environment variables to make modern GTK/Electron apps scale natively
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GDK_BACKEND = "wayland";
    XDG_CURRENT_DESKTOP = "labwc";
  };
}
