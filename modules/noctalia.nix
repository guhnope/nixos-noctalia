{ pkgs, inputs, ... }:

{
  environment.systemPackages =  with pkgs; [
    inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
    qt6Packages.qt6ct
    adw-gtk3
    nwg-look
    papirus-icon-theme
    papirus-folders
    capitaine-cursors
    material-cursors
    (pkgs.lib.hiPrio (pkgs.runCommand "launcher-hider-profile" {} ''
      appsDir=$out/share/applications
      mkdir -p $appsDir

    cat <<EOF > $appsDir/nwg-look.desktop
    [Desktop Entry]
    Type=Application
    Name=nwg-look
    NoDisplay=true
    Exec=nwg-look
    EOF

    cat <<EOF > $appsDir/qt6ct.desktop
    [Desktop Entry]
    Type=Application
    Name=Qt6 Configuration Tool
    NoDisplay=true
    Exec=qt6ct
    EOF
  ''))  ];
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
}
