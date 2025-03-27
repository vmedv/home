{ lib, ... }:

{
  options.colorMode = lib.mkOption {
    type = lib.types.str;
    default = "dark";
    description = "Option for home-manager wide theme";
  };
}
