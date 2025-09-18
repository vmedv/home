{ pkgs, inputs, ... }:

{
  programs.zed-editor = {
    enable = true;
    package = inputs.zed.packages."${pkgs.system}".zed-editor-fhs_git;
    extensions = [
      "catpuccin"
    ];
    userSettings = {
      helix_mode = true;
    };
  };
}
