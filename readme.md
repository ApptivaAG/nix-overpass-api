# nix-overpass-api

This is the [overpass-api](https://github.com/drolbr/Overpass-API) packaged with nix and uploaded to a public nix cache on cachix.org.

## build & upload new version
- set `CACHIX_AUTH_TOKEN` in `.env.default.sh`
- run `cachix push apptiva .#default`
