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
    papirus-icon-theme
    papirus-folders
    everforest-cursors
    capitaine-cursors-themed
  ];

  # 🌟 Natively modify the packages at the system layer to inject NoDisplay=true
  nixpkgs.overlays = [
    (final: prev: {
      neovim = prev.neovim.overrideAttrs (old: {
        postInstall = (old.postInstall or "") + ''
          echo "NoDisplay=true" >> $out/share/applications/nvim.desktop
        '';
      });

      nwg-look = prev.nwg-look.overrideAttrs (old: {
        postInstall = (old.postInstall or "") + ''
          echo "NoDisplay=true" >> $out/share/applications/nwg-look.desktop
        '';
      });

      qt6Packages = prev.qt6Packages // {
        qt6ct = prev.qt6Packages.qt6ct.overrideAttrs (old: {
          postInstall = (old.postInstall or "") + ''
            echo "NoDisplay=true" >> $out/share/applications/qt6ct.desktop
          '';
        });
      };

      # Overrides for printing/scanning packages
      hplip = prev.hplip.overrideAttrs (old: {
        postInstall = (old.postInstall or "") + ''
          if [ -d "$out/share/applications" ]; then
            for f in $out/share/applications/*.desktop; do
              echo "NoDisplay=true" >> "$f"
            done
          fi
        '';
      });

      cups = prev.cups.overrideAttrs (old: {
        postInstall = (old.postInstall or "") + ''
          if [ -d "$out/share/applications" ]; then
            for f in $out/share/applications/*.desktop; do
              echo "NoDisplay=true" >> "$f"
            done
          fi
        '';
      });
    })
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    noto-fonts-color-emoji
    font-awesome
  ];
}
