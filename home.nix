# home.nix
{ config, lib, pkgs, osConfig, username, activeTheme ? null, ... }:
let
  hyprland = osConfig.programs.hyprland.enable or false;
  niri     = osConfig.programs.niri.enable or false;
  noctalia = osConfig.programs.noctalia.enable or false;
  wayle    = osConfig.programs.wayle.enable or false; # Fixed
in
{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

 # 🖼️ AUTOMATED USER WALLPAPER SYSTEM
 # services.wpaperd = {
 #   enable = wayle;
 #   settings = {
 #     default = {
 #       path = "/home/${username}/Pictures/Wallpapers/Gruvbox";
 #       duration = "30m";
 #       sorting = "random";
 #     };
 #   };
 # };

  # 🖥️ DYNAMIC CONDITIONING MATRIX
  xdg.configFile = {
    # Static configs go here
  }
  // lib.optionalAttrs (hyprland && noctalia) {
    "hypr/hyprland.lua".source = ./configs/hypr-noctalia.lua;
  }
  // lib.optionalAttrs (hyprland && wayle) {
    "hypr/hyprland.lua".source = ./configs/hypr-wayle.lua;
    "wayle/config.toml".source = ./configs/wayle.toml;
  }
  // lib.optionalAttrs (niri && noctalia) {
    "niri/config.kdl".source = ./configs/niri-noctalia.kdl;
  }
  // lib.optionalAttrs (niri && wayle) {
    "niri/config.kdl".source = ./configs/niri-wayle.kdl;
    "wayle/config.toml".source = ./configs/wayle.toml;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
      fastfetch
    '';
  };
}
