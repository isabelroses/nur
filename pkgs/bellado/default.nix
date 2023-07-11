{
  fetchFromGitHub,
  lib,
  rustPlatform,
  installShellFiles,
}: let
  commit = "d84c1321353e822b9ea6c47d09a0cb16181e20a5";
in
  rustPlatform.buildRustPackage rec {
    pname = "bellado";
    version = builtins.substring 0 7 commit;

    src = fetchFromGitHub {
      owner = "isabelroses";
      repo = pname;
      rev = commit;
      sha256 = "/PrqOIsB8g/WqMuqzlQEXM3e3oDbCPDpkh0ALyiEmZs=";
    };

    cargoSha256 = "sha256-j5r+VFQSbORuSmf8xmSd90jd5UHd2SJSMiIFCU+Nvkg=";

    nativeBuildInputs = [ installShellFiles ];

    preFixup = ''
      installShellCompletion $releaseDir/build/bellado-*/out/bellado.{bash,fish}
      installShellCompletion --zsh $releaseDir/build/bellado-*/out/_bellado
    '';

    meta = with lib; {
      description = "A fast and simple cli todo tool";
      homepage = "https://github.com/isabelroses/bellado";
      license = licenses.gpl3;
      maintainers = with maintainers; [ isabelroses ];
      platforms = platforms.unix;
    };
  }
