{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.gam;
  gamHomeDir = "/home/${cfg.user}/.gam";
in {
  options.services.gam = {
    enable = mkEnableOption "GAM";
    user = mkOption {
      type = types.str;
      description = "The user under which GAM will run";
    };
    package = mkOption {
      type = types.package;
      default = pkgs.python3.pkgs.buildPythonApplication rec {
        pname = "gam";
        version = "6.58";
        format = "other";
        src = pkgs.fetchFromGitHub {
          owner = "GAM-team";
          repo = "GAM";
          rev = "refs/tags/v${version}";
          sha256 = "sha256-AIaPzYavbBlJyi9arZN8HTmUXM7Tef0SIfE07PmV9Oo=";
        };
        sourceRoot = "${src.name}/src";
        propagatedBuildInputs = with pkgs.python3.pkgs; [
          chardet
          cryptography
          distro
          filelock
          google-api-python-client
          google-auth
          google-auth-oauthlib
          httplib2
          lxml
          passlib
          pathvalidate
          python-dateutil
          setuptools
        ];
        makeWrapperArgs = [
          "--set GAMUSERCONFIGDIR ${gamHomeDir}"
          "--set GAMSITECONFIGDIR ${gamHomeDir}"
          "--set GAMCACHEDIR ${gamHomeDir}/gamcache"
          "--set GAMDRIVEDIR ${gamHomeDir}/drive"
        ];
        installPhase = ''
          runHook preInstall
          mkdir -p $out/bin
          cp gam.py $out/bin/gam
          mkdir -p $out/${pkgs.python3.sitePackages}
          cp -r gam $out/${pkgs.python3.sitePackages}
          runHook postInstall
        '';
      };
      description = "The GAM package to use";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
    
    # Create necessary directories with correct ownership
    system.activationScripts.gamDirs = ''
      mkdir -p ${gamHomeDir}/{gamcache,drive,oauth2.txt,oauth2service.json,client_secrets.json}
      chown -R ${cfg.user}:users ${gamHomeDir}
      chmod -R 755 ${gamHomeDir}
    '';

    # Set global environment variables
    environment.sessionVariables = {
      GAMUSERCONFIGDIR = gamHomeDir;
      GAMSITECONFIGDIR = gamHomeDir;
      GAMCACHEDIR = "${gamHomeDir}/gamcache";
      GAMDRIVEDIR = "${gamHomeDir}/drive";
    };
  };
}
