{
  programs.niri = {
    settings = {
      input = {
        keyboard = {
          xkb = {
            layout = "us,ru";
            options = "grp:alt_shift_toggle,compose:ralt";
          };

          repeat-delay = 200;
          repeat-rate = 40;

          numlock = true;
        };

        touchpad = {
          tap = true;
          drag = true;
          click-method = "clickfinger";
          natural-scroll = true;
          scroll-method = "two-finger";
        };

        warp-mouse-to-focus = {
          enable = true;
          mode = "center-xy";
        };

        focus-follows-mouse.enable = true;
      };
    };
  };
}
