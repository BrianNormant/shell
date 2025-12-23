{pkgs, lib, ...}:
pkgs.stdenv.mkDerivation {
  name = "qml-caelestia";
  version = "latest";
  src = ../.;
  dontWrapQtApps = true;
  nativeBuildInputs = with pkgs; [
    cmake
    ninja
    pkg-config
  ];
  buildInputs = with pkgs; [
    qt6.qtbase
    qt6.qtdeclarative
    qt6.qtwayland
    libqalculate
    pipewire
    aubio
    libcava
    fftw
  ];
  cmakeFlags = with pkgs;
    [
      (lib.cmakeFeature "ENABLE_MODULES" "plugin")
      (lib.cmakeFeature "INSTALL_QMLDIR" qt6.qtbase.qtQmlPrefix)
    ];
}
