{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem =
        { pkgs, ... }:
        {
          packages.default = pkgs.callPackage ./overpass.nix { };
          devShells.default = pkgs.mkShell {
            buildInputs = [
              pkgs.cachix
              pkgs.nixfmt-rfc-style
            ];
          };
        };
    };
  nixConfig.extra-substituters = [ "https://apptiva.cachix.org" ];
  nixConfig.extra-trusted-public-keys = [
    "apptiva.cachix.org-1:zfBxOLn+X21gqmFWJDjM9zB3qhUwXyWo1qCECsYacrk="
  ];
}
