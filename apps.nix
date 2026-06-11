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
    nwg-look
    adw-gtk3
    papirus-icon-theme
    papirus-folders
    everforest-cursors
    capitaine-cursors-themed
    ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    noto-fonts-color-emoji
    font-awesome
  ];
}
