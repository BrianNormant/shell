{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  pname = "qml-caelestia";
  version = "latest";
  src = ../.;
  dontWrapQtApps = true;
  nativeBuildInputs = with pkgs; [
    cmake
    gnumake
    pkg-config
    qt6.qtbase
    qt6.qtwayland
    libqalculate
    pipewire
    aubio
    libcava
    fftw
  ];
  outputs = ["out"];
  buildPhase = ''
    cmake .
    make
  '';
  installPhase = ''
    mkdir -p $out/lib/qml
    cp -r Niri $out/lib/qml
  '';
}
