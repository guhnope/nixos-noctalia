# home.nix
{ config, lib, pkgs, osConfig, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

  # 🖥️ UNCONDITIONAL NOCTALIA DISK MAPPING
  xdg.configFile = {
    # Niri configurations are written directly with no conditionals
    "niri/config.kdl".source = ./configs/niri.kdl;

    # You can keep your fallback hyprland shell layout here if desired
    "hypr/hyprland.lua".source = ./configs/hyprland.lua;
    "hypr/hypridle.conf".source = ./configs/hypridle.conf;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
      fastfetch
    '';
  };
}
