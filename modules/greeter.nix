{ pkgs, ... }:

let
  noctaliaGreeterPkg = pkgs.stdenv.mkDerivation {
    pname = "noctalia-greeter";
    version = "v5-alpha";

    src = pkgs.fetchFromGitHub {
      owner = "noctalia-dev";
      repo = "noctalia-greeter";
      rev = "main";
      hash = "sha256-+ZGZxVtFV6JZKK9v3U+llu4Q3s0gsyotRMjCLqq5DIA=";
    };

    nativeBuildInputs = with pkgs; [
      meson
      ninja
      pkg-config
      wayland-protocols
      wayland-scanner
      just
    ];

    buildInputs = with pkgs; [
      wayland
      cage
      wlr-randr
      libepoxy
      libglvnd
      freetype
      fontconfig
      cairo
      pango
      harfbuzz
      librsvg
      libwebp
      glib
      dbus
      polkit
      libxkbcommon
      greetd
    ];
  };
in
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        # 🌟 Wrapper fix: Launch cage first, which then hooks up and displays the greeter binary
        command = "${pkgs.cage}/bin/cage -s -- ${noctaliaGreeterPkg}/bin/noctalia-greeter";
        user = "greeter";
      };
    };
  };
}
