# home.nix
{ config, lib, pkgs, osConfig, username, activeTheme ? null, ... }:
let
  hyprland = osConfig.programs.hyprland.enable or false;
  niri     = osConfig.programs.niri.enable or false;
  noctalia = osConfig.programs.noctalia.enable or false;
  labwc    = osConfig.programs.labwc.enable or false;
in
{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

  # 🖥️ DYNAMIC CONDITIONING MATRIX
  xdg.configFile = {
    # Static configs go here
  }
  // lib.optionalAttrs (hyprland && noctalia) {
    "hypr/hyprland.lua".source = ./configs/hyprland.lua;
  }

  // lib.optionalAttrs (niri && noctalia) {
    "niri/config.kdl".source = ./configs/niri.kdl;
  }

  // lib.optionalAttrs (labwc && noctalia) {
    "labwc/autostart".source = ./configs/labwc-autostart;
    "labwc/rc.xml".source = ./configs/labwc-rc.xml;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
      fastfetch
    '';
  };
}
