{ pkgs, lib, ... }:

let
  garbageCollectionScript = pkgs.writeShellApplication {
    name = "garbage-collection";
    runtimeInputs = with pkgs; [
      nix
      nixos-rebuild
    ];
    text = ''
      cd /etc/nixos
      nix-env -p /nix/var/nix/profiles/system --delete-generations +10
      nix-store --gc
    '';
  };
in
{
  systemd.services = {
    # kbd-raw-mode = {
    #   description = "Set TTY to raw keyboard mode";
    #   wantedBy = [ "multi-user.target" ];
    #   serviceConfig = {
    #     Type = "oneshot";
    #     ExecStart = "${pkgs.kbd}/bin/kbd_mode -s < /dev/tty2";
    #   };
    # };
    garbage-collection = {
      description = "Delete all generations but last 10";
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${lib.getExe garbageCollectionScript}";
      };
    };
  };
}
