{
  description = "isabelroses' NUR";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    catppuccinifier = {
      url = "github:lighttigerXIV/catppuccinifier";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... } @ inputs: let
    systems = [ "x86_64-linux" ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
  in {
    packages = forAllSystems (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      bellado = pkgs.callPackage ./pkgs/bellado {};
      catppuccin-hyprland = pkgs.callPackage ./pkgs/catppuccin-hyprland {};
      catppuccinifier = inputs.catppuccinifier.packages.${system}.cli; 
    });
  }
  // {
    nixosModules = import ./modules;
    overlays = import ./overlays; # nixpkgs overlays 
  };
}
