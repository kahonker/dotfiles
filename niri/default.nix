{ pkgs, ... }:

{
  imports = [ ./input.nix ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
}
