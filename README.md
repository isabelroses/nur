<div align="center">

# isabel roses' nur

<img src="https://img.shields.io/github/stars/isabelroses/nur?color=f5c2e7&labelColor=303446&style=for-the-badge&logo=starship&logoColor=f5c2e7">
<a href="https://github.com/isabelroses/nur/actions/workflows/build.yml"><img alt="ci" src="https://img.shields.io/github/actions/workflow/status/isabelroses/nur/build.yml?label=build&style=for-the-badge&logo=starship&logoColor=f5c2e7" /></a>
<a href="https://isabelroses.cachix.org"><img src="https://img.shields.io/badge/cachix-isabelroses.svg?color=f5c2e7&labelColor=303446&style=for-the-badge&logo=starship&logoColor=f5c2e7"></a>
</div>

### packages

| Packages                             | Note             | Version    |
| ------------------------------------ | ---------------- | ---------- |
| [`catppuccin-hyprland`][catppuccin-hyprland]                  |                  | 99a88fd    |
| [`bellado`][bellado]                              |                  | d84c132    |
| [`catppuccinifier-cli`][catppuccinifier]                  |                  | git        |
| [`lutgen-rs`][lutgen-rs]                            |                  | 76b728a    |
| [`ags`][ags]                                  |                  | git        |

### Usage

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
[catppuccinifier]: https://github.com/lighttigerXIV/catppuccinifier
[lutgen-rs]: https://github.com/ozwaldorf/lutgen-rs
