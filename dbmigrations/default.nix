{ mkDerivation, base, bytestring, configurator, containers
, directory, fgl, filepath, HDBC, HUnit, MissingH, mtl, process
, random, split, stdenv, string-conversions, template-haskell, text
, time, yaml-light
}:
mkDerivation {
  pname = "dbmigrations";
  version = "2.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  enableSeparateDataOutput = true;
  libraryHaskellDepends = [
    base bytestring configurator containers directory fgl filepath HDBC
    HUnit mtl random split string-conversions template-haskell text
    time yaml-light
  ];
  executableHaskellDepends = [ base configurator ];
  testHaskellDepends = [
    base bytestring configurator containers directory fgl filepath HDBC
    HUnit MissingH mtl process split string-conversions
    template-haskell text time yaml-light
  ];
  description = "An implementation of relational database \"migrations\"";
  license = stdenv.lib.licenses.bsd3;
}
