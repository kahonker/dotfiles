{ pkgs, kotlin-lsp, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    fuzzel
    wl-clipboard
    xwayland-satellite
    kitty
    wireguard-tools
    unzip
    zip
    jdk25
    jdk21
    prismlauncher
    temurin-bin-25
    awww
    brightnessctl
    flavours
    quickshell
    pavucontrol
    gradle
    kotlin
    kotlin-lsp
  ];

}
