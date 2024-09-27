{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.gam;
  gamConfigDir = "/home/${cfg.user}/gam";
  gamCacheDir = "/home/${cfg.user}/gam";
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
          "--set GAMUSERCONFIGDIR ${gamConfigDir}"
          "--set GAMSITECONFIGDIR ${gamConfigDir}"
          "--set GAMCACHEDIR ${gamCacheDir}"
          "--set GAMDRIVEDIR /tmp"
        ];
        installPhase = ''
          runHook preInstall
          mkdir -p $out/bin
          cp gam.py $out/bin/gam
          mkdir -p $out/${pkgs.python3.sitePackages}
          cp -r gam $out/${pkgs.python3.sitePackages}
          runHook postInstall
        '';
        checkPhase = ''
          runHook preCheck
          ${pkgs.python3.interpreter} -m unittest discover --pattern "*_test.py" --buffer
          runHook postCheck
        '';
        meta = with lib; {
          description = "Command line management for Google Workspace";
          mainProgram = "gam";
          homepage = "https://github.com/GAM-team/GAM/wiki";
          changelog = "https://github.com/GAM-team/GAM/releases/tag/v${version}";
          license = licenses.asl20;
          maintainers = with maintainers; [ thanegill ];
        };
      };
      description = "The GAM package to use";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];

    # Create necessary directories with correct ownership
    system.activationScripts.gamDirs = ''
      mkdir -p ${gamConfigDir}
      mkdir -p ${gamCacheDir}
      chown ${cfg.user}:users ${gamConfigDir}
      chown ${cfg.user}:users ${gamCacheDir}
      chmod 700 ${gamConfigDir}
      chmod 700 ${gamCacheDir}
    '';

    # Set global environment variables
    environment.variables = {
      GAMUSERCONFIGDIR = gamConfigDir;
      GAMSITECONFIGDIR = gamConfigDir;
      GAMCACHEDIR = gamCacheDir;
    };
  };
}