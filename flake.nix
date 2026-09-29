{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    eachSystem = fn: nixpkgs.lib.genAttrs [
      "x86_64-linux"
      "aarch64-linux"
    ] (system: (fn {
      inherit system;
      pkgs = (import nixpkgs {
        inherit system;
      });
    }));
  in {
    packages = eachSystem ({ pkgs, ... }: {
      default = pkgs.stdenv.mkDerivation {
        pname = "maqao";
        version = "0.1";

        src = ./.;

        nativeBuildInputs = with pkgs; [
          gcc
          cmake
        ];

        buildInputs = with pkgs; [
          unity-test
        ];

        buildPhase = ''
          make
        '';
      };
    });
    devShells = eachSystem ({ pkgs, ... }: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          gcc
          clang-tools
          gdb
          valgrind
          gnumake
          cmake

          python3
          python3Packages.pip
          python3Packages.numpy
          python3Packages.pandas
          python3Packages.matplotlib
          python3Packages.seaborn

          unity-test
        ];
      };
    });
  };
}
