{
  fetchFromGitHub,
  lib,
  rustPlatform,
}: let
  commit = "5a570f441597656484509b617fb38ba8b7be5027";
in
  rustPlatform.buildRustPackage rec {
    pname = "bellado";
    version = builtins.substring 0 7 commit;

    src = fetchFromGitHub {
      owner = "isabelroses";
      repo = pname;
      rev = commit;
      sha256 = "k84WXZmA8McHSO1n1K5GNPFufkPzGPxYHd4KxAC2wC0=";
    };

    cargoSha256 = "sha256-CU/BhTnnFBznbZjcIqFCE836YbF9xFPHvr15QR7WV6M=";

    meta = with lib; {
      description = "A fast and simple cli todo tool";
      homepage = "https://github.com/isabelroses/bellado";
      license = licenses.gpl3;
      maintainers = with maintainers; [ isabelroses ];
      platforms = platforms.unix;
    };
  }

