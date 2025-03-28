{ pkgs, inputs, nix-colors, config, lib, ... }:

rec {
  imports = [
    nix-colors.homeManagerModules.default
    ./graphics
    ./tools
    ./utils
    ./modules/theme.nix
  ];
  
  home.username = "vmedv";
  home.homeDirectory = "/home/vmedv";

  home.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;
  home.packages = [
    inputs.zen.packages."${pkgs.system}".default
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "zen";
  };

  programs.home-manager.enable = true;

  colorScheme = if (colorMode == "light") then nix-colors.colorSchemes.cupcake
  else nix-colors.colorSchemes.everforest;

  colorMode = "dark";

  home.sessionVariables = {
    COLOR_BG = "#${config.colorScheme.palette.base00}";
    COLOR_FG = "#${config.colorScheme.palette.base07}";
    COLOR_RED = "#${config.colorScheme.palette.base08}";
    COLOR_ORANGE = "#${config.colorScheme.palette.base09}";
    COLOR_YELLOW = "#${config.colorScheme.palette.base0A}";
    COLOR_GREEN = "#${config.colorScheme.palette.base0B}";
    COLOR_CYAN = "#${config.colorScheme.palette.base0C}";
    COLOR_BLUE = "#${config.colorScheme.palette.base0D}";
    COLOR_MAGENTA = "#${config.colorScheme.palette.base0E}";
  };
}
