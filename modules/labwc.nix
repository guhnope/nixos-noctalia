{ pkgs, config, lib, ... }:

{
  programs.labwc.enable = true;

  environment.etc."xdg/labwc/autostart".text = ''
    hyprlock &
    noctalia &
  '';

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GDK_BACKEND = "wayland";
    XDG_CURRENT_DESKTOP = "labwc";
  };

  environment.etc."xdg/labwc/rc.xml".text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <labwc_config>
        <keyboard>
          <chainQuitKey>C-g</chainQuitKey>

          <keybind key="W-Return"><action name="Execute" command="ghostty" /></keybind>
          <keybind key="W-space"><action name="Execute" command="noctalia msg panel-toggle launcher" /></keybind>
          <keybind key="W-l"><action name="Execute" command="noctalia msg session lock" /></keybind>
          <keybind key="W-s"><action name="Execute" command="spotify" /></keybind>
          <keybind key="W-g"><action name="Execute" command="steam" /></keybind>
          <keybind key="W-b"><action name="Execute" command="brave" /></keybind>
          <keybind key="W-f"><action name="Execute" command="nemo" /></keybind>

          <keybind key="W-q"><action name="Close" /></keybind>
          <keybind key="W-A-backslash"><action name="ToggleFloating" /></keybind>
          <keybind key="W-A-f"><action name="ToggleFullscreen" /></keybind>
          <keybind key="W-A-a"><action name="Maximize" /></keybind>
          <keybind key="W-i"><action name="Minimize" /></keybind>

          <keybind key="W-Tab"><action name="NextWindow" /></keybind>
          <keybind key="A-Left"><action name="DirectionalFocus" direction="Left" /></keybind>
          <keybind key="A-Right"><action name="DirectionalFocus" direction="Right" /></keybind>
          <keybind key="A-Up"><action name="DirectionalFocus" direction="Up" /></keybind>
          <keybind key="A-Down"><action name="DirectionalFocus" direction="Down" /></keybind>

          <keybind key="W-C-q"><action name="Exit" /></keybind>

          <keybind key="XF86AudioRaiseVolume"><action name="Execute" command="noctalia msg volume-up" /></keybind>
          <keybind key="XF86AudioLowerVolume"><action name="Execute" command="noctalia msg volume-down" /></keybind>
          <keybind key="XF86AudioMute"><action name="Execute" command="noctalia msg volume-mute" /></keybind>
          <keybind key="XF86MonBrightnessUp"><action name="Execute" command="noctalia msg brightness-up" /></keybind>
          <keybind key="XF86MonBrightnessDown"><action name="Execute" command="noctalia msg brightness-down" /></keybind>
        </keyboard>
      </labwc_config>
    '';
  # 🌐 Declare the portals right inside the file
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];

    # Use mkDefault so it doesn't cause an immediate hard-clash if imported elsewhere
    config.common.default = lib.mkDefault [ "wlr" "gtk" ];
  };

  environment.systemPackages = with pkgs; [ labwc-tweaks-gtk ];
}
