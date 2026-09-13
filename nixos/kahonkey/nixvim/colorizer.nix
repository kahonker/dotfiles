{
  plugins.colorizer = {
    enable = true;

    settings = {
      # File types to highlight. Use "*" for all filetypes
      filetypes = [ "*" ];

      user_default_options = {
        # Default display mode: 'background', 'foreground', or 'virtualtext'
        mode = "background";

        # Parsing formats
        RGB = true; # #RGB hex codes
        RRGGBB = true; # #RRGGBB hex codes
        names = true; # Color names like "Blue"
        RRGGBBAA = true; # #RRGGBBAA hex codes
        AARRGGBB = true; # Alpha first hex codes
        rgb_fn = true; # CSS rgb() and rgba() functions
        hsl_fn = true; # CSS hsl() and hsla() functions
        css = true; # Enable all CSS features
        css_fn = true; # Enable all CSS functions

        # Tailoring for web framework ecosystems
        tailwind = true; # Enable tailwind colors
        sass = {
          enable = true;
          parsers = [ "css" ];
        };
      };
    };
  };
}
