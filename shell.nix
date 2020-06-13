{ nixpkgs ? import ./nix/pinned.nix {} }:
let
  inherit ( nixpkgs ) pkgs;
  inherit ( pkgs ) haskellPackages;

  project = import ./nixpkgs.nix;
in
pkgs.stdenv.mkDerivation {
  name = "dbmigrations-postgresql";
  buildInputs = project.dbmigrations-postgresql.nativeBuildInputs ++ [
    pkgs.postgresql
    pkgs.haskellPackages.cabal-install
    pkgs.haskellPackages.ghc
    pkgs.haskellPackages.ghcid
  ];
}
