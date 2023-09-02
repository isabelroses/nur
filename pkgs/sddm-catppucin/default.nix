{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}: let
    commit = "7fc67d1027cdb7f4d833c5d23a8c34a0029b0661";
in stdenvNoCC.mkDerivation {
  pname = "sddm-catppucin";
  version = builtins.substring 0 7 commit;

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "sddm";
    rev = commit;
    sha256 = "sha256-SjYwyUvvx/ageqVH5MmYmHNRKNvvnF3DYMJ/f2/L+Go=";
  };

  dontBuild = true;
  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -aR $src/src/catppuccin-latte $out/share/sddm/themes/catppucin-latte
    cp -aR $src/src/catppuccin-frappe $out/share/sddm/themes/catppuccin-frappe
    cp -aR $src/src/catppuccin-macchiato $out/share/sddm/themes/catppuccin-macchiato
    cp -aR $src/src/catppuccin-mocha $out/share/sddm/themes/catppuccin-mocha
  '';

    meta = with lib; {
      description = "Catppucin for SDDM";
      homepage = "https://github.com/catppuccin/sddm";
      license = licenses.mit;
      maintainers = with maintainers; [ isabelroses ];
      platforms = platforms.linux;
    };
}
