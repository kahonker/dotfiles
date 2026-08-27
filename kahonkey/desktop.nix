{ ... }:

{
  # environment.systemPackages = with pkgs; [
  #   # Example of creating a desktop item derivation
  #   (makeDesktopItem {
  #     name = "myapp"; # Must match the .desktop filename generated
  #     desktopName = "My Application";
  #     exec = "your-command";
  #     icon = "myapp-icon";
  #     categories = [ "Development" ];
  #   })
  # ];

  xdg.desktopEntries = {
    "gtnh" = {
      name = "GT: New Horizons";
      exec = "prismlauncher --launch GT_New_Horizons_2.8.4_Java_17-25";
      icon = "/home/kahonkey/.local/share/PrismLauncher/instances/GT_New_Horizons_2.8.4_Java_17-25/gtnh_icon.png";
      terminal = false;
      type = "Application";
    };
  };
}
