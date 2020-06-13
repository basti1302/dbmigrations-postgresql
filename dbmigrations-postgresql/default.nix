{ mkDerivation, base, dbmigrations, HDBC, HDBC-postgresql, HUnit
, process, stdenv
}:
mkDerivation {
  pname = "dbmigrations-postgresql";
  version = "2.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base dbmigrations HDBC-postgresql ];
  testHaskellDepends = [
    base dbmigrations HDBC HDBC-postgresql HUnit process
  ];
  description = "The dbmigrations tool built for PostgreSQL databases";
  license = stdenv.lib.licenses.bsd3;
}
