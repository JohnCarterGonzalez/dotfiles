{ pkgs, config, lib, ...}:
{
        programs.zellij = {
                enable = true;
                enableFishIntegration = true;
                settings = {
                  keybinds = {
                    normal = {
                      "bind \"Alt n\"" = {
                        NewPane = [];
                      };
                      "bind \"Alt h\" \"Alt Left\"" = {
                        MoveFocusOrTab = "Left";
                      };
                      "bind \"Ctrl z\"" = {
                        SwitchToMode = "pane";
                      };
                    };
                  };
                };
       };
}
