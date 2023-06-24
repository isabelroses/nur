{
  fetchFromGitHub,
  lib,
  pkgs,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "bellado";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "isabelroses";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-58zUi6tftTvNoc/R/HO4RDC7n+NODKOrBCHH8QntKSY=";
  };

  cargoSha256 = "sha256-hL5rOf0G+UBO8kyRXA1TqMCta00jGSZtF7n8ibjGi9k=";

  nativeBuildInputs = with pkgs; [pkg-config];
  buildInputs = with pkgs; [lz4 libxkbcommon];

  meta = with lib; {
    description = "A fast and simple cli todo tool";
    homepage = "https://github.com/isabelroses/bellado";
    license = licenses.gpl2;
    platforms = platforms.linux;
  };
}