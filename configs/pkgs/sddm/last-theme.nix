{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "last-theme";
  version = "1.0.0";
  dontBuild = true;

  src = fetchFromGitHub {
    owner = "Permafrozen";
    repo = "sddm-theme";
    rev = "ba91974e91431dbb8c0e4a20bfed4cd1a9c33e03";
    hash = "sha256-aUT/TPm6KT2g1qK6RgdlNKvaYCPH3wrxbWZ9Ty4jUMI=";
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -r . $out/share/sddm/themes/last-theme
  '';
}
