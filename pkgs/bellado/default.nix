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
    rev = "cac1f5c18727af97afb713d3bd0c51752207e209";
    sha256 = "sha256-fhct/drbhtpoYnNg4CI6wEFc+MUktWRs+Nrqju2zLOs=";
  };

  cargoSha256=$(nix-prefetch "{sha256}: let pkgs = import ./default.nix {}; pkg = pkgs.${name}.overrideAttrs (_: { src = pkgs.fetchFromGitHub { owner = \"${owner}\"; repo = \"${repo}\"; rev = \"${rev}\"; sha256 = \"${repoSha}\"; }; }); in pkg.overrideAttrs (_: {cargoSha256 = sha256;})")

  nativeBuildInputs = with pkgs; [pkg-config];
  buildInputs = with pkgs; [lz4 libxkbcommon];

  meta = with lib; {
    description = "A fast and simple cli todo tool";
    homepage = "https://github.com/isabelroses/bellado";
    license = licenses.gpl2;
    platforms = platforms.linux;
  };
}