{ pkgs, ... }:

{
  # Hardware Graphics Acceleration
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # 🎮 Core Gaming Services & Performance Daemons
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin # High-compatibility community Proton builds
      mangohud      # On-screen FPS, CPU/GPU, and frametime overlay
    ];
  };

  # Optimizes CPU governors, process priorities, and disk schedulers on the fly
  programs.gamemode.enable = true;

  # 🚀 Gaming Applications & Tools
  environment.systemPackages = with pkgs; [
    # Wine & Compatibility layers
    winetricks            # Installs missing Windows dependencies/DLLs

    # Launchers & Managers
    heroic                # Lightweight native UI for Epic Games and GOG

    # Utilities
    gamescope             # Valve's micro-compositor (fixes resolution & scaling issues)
  ];

  # ⚙️ Kernel/System Performance Tuning for Gaming
  boot.kernel.sysctl = {
    # Increases split-lock mitigation performance (fixes stuttering in certain heavy titles)
    "kernel.split_lock_mitigate" = 0;

    # Maximize memory map counts (Crucial for heavy Wine/Proton games like Cyberpunk/Starfield)
    "vm.max_map_count" = 2147483642;
  };
}
