{
  programs.niri = {
    settings = {
      layout = {
        gaps = 5;

        center-focused-column = "never";

        focus-ring.enable = false;

        border = {
          enable = true;
          width = 2;

          active = {
            color = "#ffbb66";
          };
          inactive = {
            color = "#505050";
          };
          urgent = {
            color = "#9b0000";
          };
        };

        tab-indicator = {
          gap = -5;
          width = 1;
          position = "bottom";
          gaps-between-tabs = 15;
        };

        default-column-width = {
          proportion = 0.5;
        };
      };
    };
  };
}
