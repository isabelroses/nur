# isabel roses' nur

<div align="center">
<img src="https://img.shields.io/github/stars/isabelroses/nur?color=f5c2e7&labelColor=303446&style=for-the-badge&logo=starship&logoColor=f5c2e7">
<img src="https://github.com/isabelroses/nur/actions/workflows/build.yml/badge.svg?color=f5c2e7&labelColor=303446&style=for-the-badge&logo=starship&logoColor=f5c2e7">
<a href="https://isabelroses.cachix.org"><img src="https://img.shields.io/badge/cachix-isabelroses.svg?color=f5c2e7&labelColor=303446&style=for-the-badge&logo=starship&logoColor=f5c2e7"></a>

## packages

| Packages                             | Note             | Version    |
| ------------------------------------ | ---------------- | ---------- |
| [`catppuccin-hyprland`][catppuccin-hyprland]                  |                  | 99a88fd    |
| [`bellado`][bellado]                              |                  | aa29c03    |

## Usage

```nix
{
  inputs = {
    nur.url = "github:nix-community/NUR";
    isabelroses-nur.url = "github:isabelroses/nur";
  };

  outputs = {
    self,
    nixpkgs,
    nur,
    isabelroses-nur,
    ...
  }: let
    overlays = [
      # nur overlay
      (final: prev: {
        nur = import nur {
          nurpkgs = prev;
          pkgs = prev;
          repoOverrides = {
            # other repo overrides
            isabelroses = isabelroses-nur.packages.${prev.system};
          };
        };
      })
    ];
  in {
    system = "x86_64-linux";

    modules = [
      ({config, ...}: {
        config = {
          nixpkgs.overlays = [overlays];
        };
      })
    ];
  };
}
```

[catppuccin-hyprland]: https://github.com/catppuccin/hyprland
[bellado]: https://github.com/isabelroses/bellado
