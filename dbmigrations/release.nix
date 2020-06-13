let
  pkgs = import ./nix/pinned.nix {};
in
  pkgs.haskellPackages.callPackage ./default.nix {}
