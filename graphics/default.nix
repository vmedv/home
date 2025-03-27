{ config , colorMode, ... }:

{
  imports = [
    ./cursor
    ./hypr
    ./eww.nix
    ./fuzzel.nix
  ];
}
