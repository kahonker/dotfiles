{ ... }:

{
  environment = {
    variables = {
      SUDO_EDITOR = "nvim";
    };

    etc = {
      "1password/custom_allowed_browsers" = {
        text = "qutebrowser";
        mode = "0755";
      };
    };
  };
}
