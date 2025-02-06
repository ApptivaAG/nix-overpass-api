{
  stdenv,
  fetchzip,
  zlib,
  expat,
  ...
}:
let
  version = "0.7.62";
in
stdenv.mkDerivation {
  name = "overpass-api";
  inherit version;
  src = fetchzip {
    url = "http://dev.overpass-api.de/releases/osm-3s_v${version}.tar.gz";
    hash = "sha256-mEGQkrwqHHiTr7nkJR/G5RNp0ile3O+KG2G28M3nypQ=";
  };
  CXXFLAGS = "-O2";
  enableParallelBuilding = true;
  buildInputs = [
    zlib
    expat
  ];
}
