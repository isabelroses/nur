{
  fetchFromGitHub,
  lib,
  rustPlatform,
}: let
  commit = "61f36030742df5ee85adf8e7d14871e24774a623";
in
  rustPlatform.buildRustPackage rec {
    pname = "bellado";
    version = builtins.substring 0 7 commit;

    src = fetchFromGitHub {
      owner = "isabelroses";
      repo = pname;
      rev = commit;
      sha256 = "J+tMtoxe4NGDXWNDNiByiKkkdsBQW1h18sWD+fKLzJk=";
    };

    cargoSha256 = "sha256-hY4WKrLEF0UGQCJDZJJAYKuhTQMWWdQ0VHzP0hpEs2Y=";

    meta = with lib; {
      description = "A fast and simple cli todo tool";
      homepage = "https://github.com/isabelroses/bellado";
      license = licenses.gpl2;
      maintainers = with maintainers; [ isabelroses ];
    };
  }
