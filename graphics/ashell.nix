{ inputs, pkgs, config, ... }:

{

  # since module generates .yml config which (i suppose) can't
  # be read correctly i place config by hand
  home.file.".config/ashell/config.toml".source = ./ashell-cfg.toml;
  
  programs.ashell = {
    enable = true;
    systemd.enable = true;
    package = inputs.ashell.defaultPackage."x86_64-linux";
  };
}
