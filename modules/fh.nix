{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs.fh;
in {
  options.programs.fh = {
    enable = lib.mkEnableOption "fh dev project scaffolder";

    PS1 = lib.mkOption {
      type = lib.types.str;
      # default matches the DEFAULT_PS1 in the script above
      default = ''
        [\u@\h \w]$ 
      '';
      description = "Prompt (PS1) injected into dev shells created by fh. Use bash escape sequences.";
    };
  };

  config = lib.mkIf cfg.enable {
    # we install fh as a small, self-contained application and inject FH_PS1 at build time
    home.packages = [
      (pkgs.writeShellApplication {
        name = "fh";
        runtimeInputs = with pkgs; [git coreutils];
        text = ''
          export FH_PS1=${lib.escapeShellArg cfg.PS1}
          # embedded fh script follows
          ${builtins.readFile ../fh}
        '';
      })
    ];
  };
}
