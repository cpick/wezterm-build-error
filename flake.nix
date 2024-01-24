{
  inputs = {
    nixpkgs.url = "nixpkgs/4471857c0a4a8a0ffc7bdbeaf1b998746ce12a82";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-darwin;
    in {

      packages.x86_64-darwin.default = pkgs.darwin.apple_sdk_11_0.callPackage (
        { rustPlatform }:
        rustPlatform.buildRustPackage {
          name = "wezterm-build-error";
          src = ./.;
          cargoLock = { lockFile = ./Cargo.lock; };
          buildInputs = [ pkgs.darwin.apple_sdk_11_0.Libsystem ];
        }
      ) {};

    };
}
