{ pkgs ? import <nixpkgs> {} }:

let 
  python = import ./requirements.nix { inherit pkgs; };
in pkgs.python37Packages.buildPythonPackage rec {
  pname = "pros-cli";
  version = "3.1.4";
  src = pkgs.fetchFromGitHub {
    owner = "purduesigbots";
    repo = "pros-cli";
    rev = "release-${version}";
    sha256 = "16xj3r5hfs7wk21hy9sijmrrjkhwlf1ras18zdh1j0ih6pfa1pa0";
  };
  # For some reason prosv5 can't find its version, so patch it in here.
  preConfigure = ''
    sed -i '/^def get_version/a\ \ \ \ return "${version}"' \
      pros/common/utils.py
  '';
  buildInputs = [ pkgs.stdenv ];
  propagatedBuildInputs = builtins.attrValues python.packages 
  ++ (with pkgs.python37Packages; [
    requests
    tabulate
    jsonpickle
    colorama
    pyzmq
    sentry-sdk
  ]);
  doCheck = false;
}
