let
  pkgs =
    import (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/4ecab3273592f27479a583fb6d975d4aba3486fe.tar.gz";
      sha256 = "10wn0l08j9lgqcw8177nh2ljrnxdrpri7bp0g7nvrsn9rkawvlbf";
    }) {};

  pkgsGcc =
    import (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/release-24.05.tar.gz";
      sha256 = "0asfn6clphn8gb0d17l6mc4yxwc3xr41hndq2s49wyl5siyi1730";
    }) {};
in
pkgs.mkShell {
  nativeBuildInputs = [
    pkgs.haskell.compiler.ghc88
    pkgs.cabal-install
    pkgs.git
    pkgsGcc.gcc9 # later versions fail with issue https://github.com/jberthold/packman/issues/17
  ];
}

