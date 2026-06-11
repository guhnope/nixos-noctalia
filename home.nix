{ config, lib, pkgs, osConfig, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

  xdg.configFile = lib.mkMerge [
    (lib.optionalAttrs osConfig.programs.mango.enable {
      "mango/config.conf".source = ./configs/mango-config.conf;
      "mango/bind.conf".source = ./configs/mango-bind.conf;
      "mango/rule.conf".source = ./configs/mango-rule.conf;
    })
    (lib.optionalAttrs osConfig.programs.niri.enable {
      "niri/config.kdl".source = ./configs/niri.kdl;
    })
    (lib.optionalAttrs osConfig.programs.hyprland.enable {
      "hypr/hyprland.lua".source  = ./configs/hyprland.lua;
      "hypr/hypridle.conf".source = ./configs/hypridle.conf;
    })
    (lib.optionalAttrs (osConfig.programs ? labwc && osConfig.programs.labwc.enable) {
      "labwc/autostart".source = ./configs/labwc-autostart;
      "labwc/rc.xml".source    = ./configs/labwc-rc.xml;
    })
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
      fastfetch
    '';
  };
}
