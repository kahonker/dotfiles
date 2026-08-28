{ pkgs, ... }:

{
  imports = [
    ./input.nix
    ./layout.nix
    ./binds.nix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;

    settings = {
      hotkey-overlay.skip-at-startup = true;
    };
  };
}
