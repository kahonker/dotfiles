{ pkgs, ... }:

{
  imports = [
    ./input.nix
    ./layout.nix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
}
