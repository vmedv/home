{ pkgs, config , colorMode, ... }:

{
  imports = [
    ./cursor
    ./hypr
    ./eww.nix
    ./fuzzel.nix
    ./ashell.nix
  ];
  home.packages = [pkgs.kdePackages.qtsvg pkgs.quickshell];
}
