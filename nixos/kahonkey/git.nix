{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Alexey Khoroshenkiy";
        email = "alexeyk4@nycstudents.net";
        signingKey = "3ABDAA07C4195401";
      };

      core = {
        editor = "nvim";
        pager = "less -FRX";
      };

      init = {
        defaultBranch = "main";
      };

      push = {
        autoSetupRemote = true;
      };

      commit = {
        gpgsign = true;
      };
    };
  };
}
