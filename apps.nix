{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lazygit
    git
    curl
    wget
    unzip
    zip
    tree
    ripgrep
    wl-clipboard
    fastfetch
    neovim
    ghostty
    nemo
    engrampa
    mousepad
    paperwork
    spotify
    imv
    mpv
    brave
    discord
    obsidian
    signal-desktop
    zed-editor
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

      # 1. Hide Neovim Launcher Wrapper
      cat <<EOF > $appsDir/nvim.desktop
      [Desktop Entry]
      Type=Application
      Name=Neovim
      NoDisplay=true
      Exec=nvim %F
      EOF

      cat <<EOF > $appsDir/hp-uiscan.desktop
      [Desktop Entry]
      Type=Application
      Name=HP Linux Imaging and Printing Scanner
      NoDisplay=true
      Exec=hp-uiscan
      EOF

      cat <<EOF > $appsDir/hplip.desktop
      [Desktop Entry]
      Type=Application
      Name=HPLIP Toolbox
      NoDisplay=true
      Exec=hp-toolbox
      EOF

      cat <<EOF > $appsDir/cups.desktop
      [Desktop Entry]
      Type=Application
      Name=Manage Printing
      NoDisplay=true
      Exec=xdg-open http://localhost:631/
      EOF

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
    ''))
  ];
  # 🌟 Force Nemo to permanently silence the thumbnail cache warning banner (Native NixOS)
    programs.dconf.enable = true;
    programs.dconf.profiles.user.databases = [
      {
        settings = {
          "org/nemo/preferences" = {
            ignore-thumbnailers-problem = true;
          };
        };
      }
    ];

  fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      noto-fonts-color-emoji
      font-awesome
  ];
}
