{
  pkgs,
  kotlin-lsp,
  inputs,
  ...
}:

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
    pavucontrol
    gradle
    kotlin
    kotlin-lsp
    inputs.qml-niri.packages.x86_64-linux.default
    inputs.qml-niri.packages.x86_64-linux.quickshell
  ];

}
