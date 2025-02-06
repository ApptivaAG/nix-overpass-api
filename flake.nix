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
}
