{ pkgs
, lib
, config
, inputs
, ...
}: {
  dotenv.enable = true;

  packages = with pkgs; [
    phpactor
    rustywind
    tailwindcss-language-server
    emmet-ls
  ];

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";

  enterShell = ''
    alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
    alias pint='sh $([ -f pint ] && echo pint || echo vendor/bin/pint)'
  '';

  # https://devenv.sh/tests/
  enterTest = ''
  '';

  services = {
    mysql = {
      enable = true;
      ensureUsers = [
        {
          name = "laraveldb";
          password = "maria";
          ensurePermissions = {
            "laraveldb.*" = "ALL PRIVILEGES";
          };
        }
      ];
      initialDatabases = [
        { name = "laraveldb"; }
      ];
      settings = {
        mysqld = {
          key_buffer_size = "6G";
          table_cache = 1600;
          log-error = "/var/log/mysql_err.log";
          plugin-load-add = [ "server_audit" "ed25519=auth_ed25519" ];
        };
        mysqldump = {
          quick = true;
          max_allowed_packet = "16M";
        };
      };
    };

    redis = {
      enable = true;
      package = pkgs.redis;
      bind = "127.0.0.1";
      port = 6379;
      extraConfig = ''
        # Add any additional Redis configuration here
        maxmemory 256mb
        maxmemory-policy allkeys-lru
      '';
    };
  };

  languages = {
    php = {
      enable = true;
      package = pkgs.php83;
      packages = {
        inherit (pkgs.php83Packages) composer;
      };
    };
    javascript = {
      enable = true;
      package = pkgs.nodejs_20;
      npm.enable = true;
    };
  };

  # https://devenv.sh/pre-commit-hooks/
  pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";
}
