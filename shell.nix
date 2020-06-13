{ nixpkgs ? import ./nix/pinned.nix {} }:
let
  inherit ( nixpkgs ) pkgs;
  inherit ( pkgs ) haskellPackages;

  project = import ./release.nix;
in
pkgs.stdenv.mkDerivation {
  name = "dbmigrations-postgresql";
  buildInputs = project.env.nativeBuildInputs ++ [
    haskellPackages.cabal-install
    haskellPackages.ghcid
  ];
}
