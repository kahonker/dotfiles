{ pkgs, ... }:

{
  imports = [
    ./input.nix
    ./layout.nix
    ./binds.nix
    ./window-rules.nix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;

    settings = {
      spawn-at-startup = [
        { argv = [ "glide" ]; }
      ];

      hotkey-overlay.skip-at-startup = true;

      prefer-no-csd = true;

      cursor = {
        hide-when-typing = true;
        hide-after-inactive-ms = 1000;
      };

      clipboard.disable-primary = true;

      workspaces = {
        "terminals" = { };
        "browser" = { };
        "games" = { };
        "misc" = { };
      };
    };
  };
}
