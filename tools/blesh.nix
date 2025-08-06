{ pkgs, ... }:

{
  programs.bash.enable = true;
  programs.fzf = {
    enable = true;
    enableBashIntegration = true; 
  };
  programs.zathura.enable = true;
  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
  };
  programs.broot = {
    enable = true;
    enableBashIntegration = true;
  };
  programs.eza = {
    enable = true;
    enableBashIntegration = true;
  };
}
