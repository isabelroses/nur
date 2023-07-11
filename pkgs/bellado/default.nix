{
  fetchFromGitHub,
  lib,
  rustPlatform,
}: let
  commit = "aa29c0379d5919f553ea13ccf1f74f86d7a5eda7";
in
  rustPlatform.buildRustPackage rec {
    pname = "bellado";
    version = builtins.substring 0 7 commit;

    src = fetchFromGitHub {
      owner = "isabelroses";
      repo = pname;
      rev = commit;
      sha256 = "wRaE3v5zehssuo6w+gI1mwRK4Rn6JCCbrxfNCGYFadY=";
    };

    cargoSha256 = "sha256-RbV58uUjWT0vdcNJtV0jCm2ilbijZL6qUAP7gDBvZdE=";

    meta = with lib; {
      description = "A fast and simple cli todo tool";
      homepage = "https://github.com/isabelroses/bellado";
      license = licenses.gpl3;
      maintainers = with maintainers; [ isabelroses ];
      platforms = platforms.unix;
    };
  }
