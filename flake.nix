{
  description = "isabelroses' NUR repository";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    systems = [
      "x86_64-linux"
    ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
  in {
    packages = forAllSystems (system:
      import ./default.nix {
        pkgs = import nixpkgs {
          inherit system;
        };
      });
    overlays.default = import ./overlays;
  };
}
