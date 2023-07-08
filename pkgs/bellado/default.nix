{
  fetchFromGitHub,
  lib,
  rustPlatform,
}: let
  commit = "56f051ea996a85d8ab1f624bed868e675e6ad164";
in
  rustPlatform.buildRustPackage rec {
    pname = "bellado";
    version = builtins.substring 0 7 commit;

    src = fetchFromGitHub {
      owner = "isabelroses";
      repo = pname;
      rev = commit;
      sha256 = "iIXWlPAvNPqL77Lh1SM+75LAJle5BG4U5gpKYDn8yrM=";
    };

    cargoSha256 = "sha256-GHv/2cSGZKiwOAj4dlhxL4wQo5LQaxnZQRDrCbpPI9E=";

    meta = with lib; {
      description = "A fast and simple cli todo tool";
      homepage = "https://github.com/isabelroses/bellado";
      license = licenses.gpl3;
      maintainers = with maintainers; [ isabelroses ];
      platforms = platforms.unix;
    };
  }
