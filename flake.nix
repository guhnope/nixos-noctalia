{
  description = "NixOS Flake with Noctalia (Hyprland & Niri)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
        };
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
        };
    mango = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  outputs = inputs@{ self, nixpkgs, noctalia, noctalia-greeter, mango, home-manager, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        home-manager.nixosModules.home-manager
        ./modules/limine.nix
        /etc/nixos/hardware-configuration.nix
        ./configuration.nix
        ./apps.nix
        ./modules/niri.nix
        ./modules/hyprland.nix
        ./modules/mango.nix
        ./modules/noctalia.nix
        ./modules/greeter.nix
        ./modules/gaming.nix
#        ./modules/labwc.nix
      ];
    };
  };
}
