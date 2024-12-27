let
  pkgs =
    import (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/4ecab3273592f27479a583fb6d975d4aba3486fe.tar.gz";
      sha256 = "10wn0l08j9lgqcw8177nh2ljrnxdrpri7bp0g7nvrsn9rkawvlbf";
    }) {};

  pkgs2405 =
    import (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/31ac92f9628682b294026f0860e14587a09ffb4b.tar.gz";
      sha256 = "0qbyywfgjljfb4izdngxvbyvbrkilmpsmmx2a9spbwir2bcmbi14";
    }) {};
in
pkgs.mkShell {
  nativeBuildInputs = [
    pkgs.haskell.compiler.ghc90
    pkgs.cabal-install
    pkgs.git
    pkgs2405.gcc9 # later versions fail with issue https://github.com/jberthold/packman/issues/17
  ];
}

