# /etc/nixos/noctalia.nix
{ pkgs, inputs, lib, config, ... }:

{
  options.programs.noctalia.enable = lib.mkEnableOption "Noctalia Shell Environment";
  config = lib.mkIf config.programs.noctalia.enable {
    _module.args = { inherit inputs; };
    environment.systemPackages = [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
