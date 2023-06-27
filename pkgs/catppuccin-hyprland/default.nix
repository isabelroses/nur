{
  pkgs,
  fetchFromGitHub,
  ...
}: let
  commit = "99a88fd21fac270bd999d4a26cf0f4a4222c58be";
in
  pkgs.stdenv.mkDerivation rec {
    pname = "catppuccin-hyprland";
    version = builtins.substring 0 7 commit;

    src = fetchFromGitHub {
      owner = "catppuccin";
      repo = "hyprland";
      rev = commit;
      sha256 = "07B5QmQmsUKYf38oWU3+2C6KO4JvinuTwmW1Pfk8CT8=";
    };

    meta = {
      description = "Catppuccin for hyprland";
      homepage = "https://github.com/catppuccin/hyprland";
    };

    installPhase = ''
      mkdir -p $out/share/
      cp -r ${src}/themes $out/share/themes
    '';
  }
