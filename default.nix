let
  nixpkgs = import ./nixpkgs.nix;
in
{ dbmigrations-postgresql = nixpkgs.dbmigrations-postgresql; }
