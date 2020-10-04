# generated using pypi2nix tool (version: 2.0.4)
# See more at: https://github.com/nix-community/pypi2nix
#
# COMMAND:
#   pypi2nix -V python37 -r requirements.txt
#

{ pkgs ? import <nixpkgs> {},
  overrides ? ({ pkgs, python }: self: super: {})
}:

let

  inherit (pkgs) makeWrapper;
  inherit (pkgs.stdenv.lib) fix' extends inNixShell;

  pythonPackages =
  import "${toString pkgs.path}/pkgs/top-level/python-packages.nix" {
    inherit pkgs;
    inherit (pkgs) stdenv;
    python = pkgs.python37;
  };

  commonBuildInputs = [];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreterWithPackages = selectPkgsFn: pythonPackages.buildPythonPackage {
        name = "python37-interpreter";
        buildInputs = [ makeWrapper ] ++ (selectPkgsFn pkgs);
        buildCommand = ''
          mkdir -p $out/bin
          ln -s ${pythonPackages.python.interpreter} \
              $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "
              (selectPkgsFn pkgs)}; do
            if [ -d "$dep/bin" ]; then
              for prog in "$dep/bin/"*; do
                if [ -x "$prog" ] && [ -f "$prog" ]; then
                  ln -s $prog $out/bin/`basename $prog`
                fi
              done
            fi
          done
          for prog in "$out/bin/"*; do
            wrapProgram "$prog" --prefix PYTHONPATH : "$PYTHONPATH"
          done
          pushd $out/bin
          ln -s ${pythonPackages.python.executable} python
          ln -s ${pythonPackages.python.executable} \
              python3
          popd
        '';
        passthru.interpreter = pythonPackages.python;
      };

      interpreter = interpreterWithPackages builtins.attrValues;
    in {
      __old = pythonPackages;
      inherit interpreter;
      inherit interpreterWithPackages;
      mkDerivation = args: pythonPackages.buildPythonPackage (args // {
        nativeBuildInputs = (args.nativeBuildInputs or []) ++ args.buildInputs;
      });
      packages = pkgs;
      overrideDerivation = drv: f:
        pythonPackages.buildPythonPackage (
          drv.drvAttrs // f drv.drvAttrs // { meta = drv.meta; }
        );
      withPackages = pkgs'':
        withPackages (pkgs // pkgs'');
    };

  python = withPackages {};

  generated = self: {
    "cachetools" = python.mkDerivation {
      name = "cachetools-4.1.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/fc/c8/0b52cf3132b4b85c9e83faa3e4d375575afeb3a1710c40b2b2cd2a3e5635/cachetools-4.1.1.tar.gz";
        sha256 = "bbaa39c3dede00175df2dc2b03d0cf18dd2d32a7de7beb68072d13043c9edb20";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/tkem/cachetools/";
        license = licenses.mit;
        description = "Extensible memoizing collections and decorators";
      };
    };

    "click" = python.mkDerivation {
      name = "click-6.7";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897/click-6.7.tar.gz";
        sha256 = "f15516df478d5a56180fbf80e68f206010e6d160fc39fa508b65e035fd75130b";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/mitsuhiko/click";
        license = licenses.bsdOriginal;
        description = "A simple wrapper around optparse for powerful command line utilities.";
      };
    };

    "cobs" = python.mkDerivation {
      name = "cobs-1.1.4";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/46/49/e49f943433faae9e6b6e802a04f1004b0013bca2cafeb1f3c6a13b1deb18/cobs-1.1.4.tar.gz";
        sha256 = "c4fc36e3e1d3ff57670982a1b0856ca15255ab56c73c6f915ed6a45b51fa341c";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://bitbucket.org/cmcqueen1975/cobs-python/";
        license = licenses.mit;
        description = "Consistent Overhead Byte Stuffing (COBS)";
      };
    };

    "lepl" = python.mkDerivation {
      name = "lepl-5.1.3";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/fd/5d/7ec76725dab377d26cfbbb769c7fd5f7126a1cbf68934887e30514f04df2/LEPL-5.1.3.zip";
        sha256 = "da6dfa01bbd449f8544857b13474ad52fcca30a5d30de96271c70f34c7a3f96e";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.acooke.org/lepl/";
        license = licenses.lgpl2;
        description = "A Parser Library for Python 2.6+/3+: Recursive Descent; Full Backtracking";
      };
    };

    "observable" = python.mkDerivation {
      name = "observable-1.0.3";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/24/57/013c2610cf93f9ae87e522be17d679bcba0e7cee2cd8da4dc8efddef1138/observable-1.0.3.tar.gz";
        sha256 = "97fe8e9d8c2a6185cee3661fa5fba9ce38c7ba388894132940cd6a81633626d9";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/timofurrer/observable";
        license = licenses.mit;
        description = "minimalist event system";
      };
    };

    "pypng" = python.mkDerivation {
      name = "pypng-0.0.20";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/bc/fb/f719f1ac965e2101aa6ea6f54ef8b40f8fbb033f6ad07c017663467f5147/pypng-0.0.20.tar.gz";
        sha256 = "1032833440c91bafee38a42c38c02d00431b24c42927feb3e63b104d8550170b";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/drj11/pypng";
        license = licenses.mit;
        description = "Pure Python PNG image encoder/decoder";
      };
    };

    "pyserial" = python.mkDerivation {
      name = "pyserial-3.4";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/cc/74/11b04703ec416717b247d789103277269d567db575d2fd88f25d9767fe3d/pyserial-3.4.tar.gz";
        sha256 = "6e2d401fdee0eab996cf734e67773a0143b932772ca8b42451440cfed942c627";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pyserial/pyserial";
        license = licenses.bsdOriginal;
        description = "Python Serial Port Extension";
      };
    };

    "rfc6266-parser" = python.mkDerivation {
      name = "rfc6266-parser-0.0.6";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/81/cf/1f4977bd110bb78c7ff1b8a6344bb0630e25ad42870099e56f9896a302cb/rfc6266-parser-0.0.6.tar.gz";
        sha256 = "6eb7d7223c75727ac697d3150c3eea461e1660a9ca116bb29b57d751abeeec65";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."lepl"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/SWW13/python-rfc6266-parser";
        license = licenses.lgpl2;
        description = "Parse and generate Content-Disposition headers; Fork of rfc6266 with bugfixes.";
      };
    };

    "scan-build" = python.mkDerivation {
      name = "scan-build-2.0.13";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/7e/94/c8235245aee84953a03ed49e2bb6985afa03099a3a0b190a9a0db74701bb/scan-build-2.0.13.tar.gz";
        sha256 = "930cb58ccc0cd4645534ebb41df23bb9766c97c4a66f9f5c6fa9ff7843a391fc";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."typing"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/rizsotto/scan-build";
        license = licenses.ncsa;
        description = "static code analyzer wrapper for Clang.";
      };
    };

    "semantic-version" = python.mkDerivation {
      name = "semantic-version-2.8.5";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/d4/52/3be868c7ed1f408cb822bc92ce17ffe4e97d11c42caafce0589f05844dd0/semantic_version-2.8.5.tar.gz";
        sha256 = "d2cb2de0558762934679b9a104e82eca7af448c9f4974d1f3eeccff651df8a54";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/rbarrois/python-semanticversion";
        license = licenses.bsdOriginal;
        description = "A library implementing the 'SemVer' scheme.";
      };
    };

    "typing" = python.mkDerivation {
      name = "typing-3.7.4.3";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/05/d9/6eebe19d46bd05360c9a9aae822e67a80f9242aabbfc58b641b957546607/typing-3.7.4.3.tar.gz";
        sha256 = "1187fb9c82fd670d10aa07bbb6cfcfe4bdda42d6fab8d5134f04e8c4d0b71cc9";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.python.org/3/library/typing.html";
        license = licenses.psfl;
        description = "Type Hints for Python";
      };
    };
  };
  localOverridesFile = ./requirements_override.nix;
  localOverrides = import localOverridesFile { inherit pkgs python; };
  commonOverrides = [
        (let src = pkgs.fetchFromGitHub { owner = "nix-community"; repo = "pypi2nix-overrides"; rev = "90e891e83ffd9e55917c48d24624454620d112f0"; sha256 = "0cl1r3sxibgn1ks9xyf5n3rdawq4hlcw4n6xfhg3s1kknz54jp9y"; } ; in import "${src}/overrides.nix" { inherit pkgs python; })
  ];
  paramOverrides = [
    (overrides { inherit pkgs python; })
  ];
  allOverrides =
    (if (builtins.pathExists localOverridesFile)
     then [localOverrides] else [] ) ++ commonOverrides ++ paramOverrides;

in python.withPackages
   (fix' (pkgs.lib.fold
            extends
            generated
            allOverrides
         )
   )