{
  programs.niri = {
    settings = {
      window-rules = [
        # Universal rules
        {
          geometry-corner-radius = {
            top-left = 5.0;
            top-right = 5.0;
            bottom-left = 5.0;
            bottom-right = 5.0;
          };
          clip-to-geometry = true;
          open-maximized = true;
        }

        # Open fullscreen
        {
          matches = [
            { title = "^GT"; }
          ];
          open-fullscreen = true;
        }

        # Open not focused
        {
          matches = [
            { title = "^GT"; }
            { title = "^Please wait"; }
          ];
          open-focused = false;
        }

        # Open not maximized
        {
          matches = [
            { app-id = "Alacritty|kitty"; }
          ];
          open-maximized = false;
        }

        # Open on workspace
        {
          matches = [
            { app-id = "PrismLauncher$"; }
            { title = "^GT"; }
          ];
          open-on-workspace = "games";
        }

        {
          matches = [
            { app-id = "Alacritty|kitty"; }
          ];
          open-on-workspace = "aerminal";
        }

        {
          matches = [
            { app-id = "glide$"; }
          ];
          open-on-workspace = "browser";
        }

        # Open floating
        {
          matches = [
            {
              app-id = "glide$";
              title = "^Picture-in-Picture$";
            }
            { title = " Prism Launcher "; }
          ];
          open-floating = true;
        }

        # Opacity
        {
          matches = [
            { app-id = "Alacritty|kitty"; }
          ];
          opacity = 0.8;
        }

        {
          matches = [
            {
              app-id = "Alacritty|kitty";
              is-active = true;
            }
          ];
          opacity = 0.95;
        }

        # Turn on blur
        {
          matches = [
            { app-id = "Alacritty|kitty"; }
          ];
          background-effect = {
            blur = true;
          };
        }

        # Block screen capture
        {
          matches = [
            { app-id = "^org\\.keepassxc\\.KeePassXC$"; }
            { app-id = "^org\\.gnome\\.World\\.Secrets$"; }
          ];
          block-out-from = "screen-capture";
        }

      ];
    };
  };
}
