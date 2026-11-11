{
  programs.qutebrowser = {
    enable = true;

    settings = {
      auto_save.session = true;

      colors = {
        webpage = {
          darkmode.enabled = true;
          preferred_color_scheme = "dark";
        };
      };

      confirm_quit = [ "downloads" ];

      content = {
        autoplay = false;
        blocking.method = "both";
        fullscreen.window = true;
        prefers_reduced_motion = true;
        pdfjs = true;
      };

      input = {
        insert_mode = {
          auto_load = true;
        };
      };

      new_instance_open_target = "window";

      qt = {
        chromium.process_model = "process-per-site";
        workarounds.disable_accessibility = "always";
      };

      tabs = {
        show = "never";
        tabs_are_windows = true;
      };

      window.hide_decoration = true;
    };

    keyBindings = {
      normal = {
        "<Shift-ctrl-f>" = "spawn --userscript qute-1pass-fill";
        "<Shift-ctrl-g>" = "spawn --userscript qute-1pass-generate";
      };
    };
  };

}
