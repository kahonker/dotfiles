{
  # services.ssh-agent.enable = true;
  programs.ssh = {
    enable = true;

    enableDefaultConfig = false;

    settings = {
      "github.com" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "~/.ssh/git";
      };
    };
  };
}
