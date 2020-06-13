let
  nixpkgSrc = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/1cd56fc68216423a0413294c8e56453166be87dd.tar.gz";
    sha256 = "0cihxsy5958l9nk0rlnwd1bz4ayhrp7v5bspjdrmfgwgv40j0rw3";
  };

  overlay = self: super: {
    project-pkg-set = self.haskell.packages.ghc883.override {
      overrides = hself: hsuper: {
        dbmigrations = hself.callPackage ./dbmigrations/default.nix {};
        dbmigrations-postgresql = hself.callPackage ./dbmigrations-postgresql/default.nix {};

        project-packages = [
          hself.dbmigrations
          hself.dbmigrations-postgresql
        ];
      };
    };

    dbmigrations-postgresql = self.buildEnv {
      name = "dbmigrations-postgresql ";
      paths = self.project-pkg-set.project-packages;
    };
  };
in
import nixpkgSrc {
  overlays = [ overlay ];
}
