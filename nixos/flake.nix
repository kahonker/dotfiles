{
  description = "My first Nix flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";

    niri = {
      url = "github:epireyn/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    glide = {
      url = "github:glide-browser/glide.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      niri,
      glide,
      nixvim,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      kotlin-lsp = pkgs.stdenv.mkDerivation rec {
        pname = "kotlin-lsp";
        version = "263.4702.0";

        src = pkgs.fetchurl {
          url = "https://download.jetbrains.com/language-server/kotlin-server/${version}/kotlin-server-${version}.tar.gz";
          hash = "sha256-HhHS5f77+eohWtjda+lfIiKJfNCG6Mt6ZhpSCEpZBAU=";
        };

        nativeBuildInputs = [
          pkgs.autoPatchelfHook
        ];

        buildInputs = with pkgs; [
          # Core C/C++ libraries (libstdc++.so.6, libgcc_s.so.1)
          stdenv.cc.cc.lib

          # Compression (libz.so.1)
          zlib

          # Wayland (libwayland-client.so.0, libwayland-cursor.so.0)
          wayland

          # X11 (libX11.so.6, libXext.so.6, libXi.so.6, libXrender.so.1, libXtst.so.6)
          libx11
          libxext
          libxi
          libxrender
          libxtst

          # Audio (libasound.so.2)
          alsa-lib

          # Fonts & Keyboard (libfreetype.so.6, libxkbcommon.so.0)
          freetype
          libxkbcommon
        ];

        installPhase = ''
          mkdir -p $out/bin
          cp -r . $out/
          chmod +x $out/bin/intellij-server
          ln -s $out/bin/intellij-server $out/bin/kotlin-lsp
        '';
      };
    in
    {
      nixosConfigurations = {
        pleiades = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs kotlin-lsp; };
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs kotlin-lsp; };
              home-manager.users.kahonkey = ./home.nix;
            }
          ];
        };
      };
    };
}
