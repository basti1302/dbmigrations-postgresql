let
  pkgs = import <nixpkgs> {};
in
import (
  pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "1cd56fc68216423a0413294c8e56453166be87dd";
    sha256 = "0cihxsy5958l9nk0rlnwd1bz4ayhrp7v5bspjdrmfgwgv40j0rw3";
  }
)
