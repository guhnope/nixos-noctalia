# home.nix
{ config, lib, pkgs, osConfig, username, activeTheme ? null, ... }:
let
  hyprland = osConfig.programs.hyprland.enable or false;
  niri     = osConfig.programs.niri.enable or false;
  noctalia = osConfig.programs.noctalia.enable or false;
  waybar    = osConfig.programs.waybar.enable or false;
  qtile    = osConfig.services.xserver.windowManager.qtile.enable or false;
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
    "hypr/hyprland.lua".source = ./configs/hypr-noctalia.lua;
  }
  // lib.optionalAttrs (hyprland && waybar) {
    "hypr/hyprland.lua".source = ./configs/hypr-waybar.lua;
    # 🛑 Removed waybar.toml link so GUI tool works freely!
  }
  // lib.optionalAttrs (niri && noctalia) {
    "niri/config.kdl".source = ./configs/niri-noctalia.kdl;
  }
  // lib.optionalAttrs (niri && waybar) {
    "niri/config.kdl".source = ./configs/niri-waybar.kdl;

  }
  // lib.optionalAttrs (qtile && waybar) {

  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
      fastfetch
    '';
  };
}
