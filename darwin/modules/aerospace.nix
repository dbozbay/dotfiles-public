{
 services.aerospace = {
   enable = true;
   settings = {
    after-login-command = [];
    after-startup-command = [];
    # start-at-login = true;
    enable-normalization-flatten-containers = true;
    enable-normalization-opposite-orientation-for-nested-containers = true;
    accordion-padding = 30;
    default-root-container-layout = "tiles";
    default-root-container-orientation = "auto";
    key-mapping = {
      preset = "qwerty";
    };
    on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];
    on-focus-changed = ["move-mouse window-lazy-center"];
    gaps = {
      inner = {
        horizontal = 10;
        vertical = 10;
      };
      outer = {
        left = 10;
        bottom = 10;
        top = 10;
        right = 10;
      };
    };
    mode = {
      main = {
        binding = {
          "alt-t" = "exec-and-forget open -n /Applications/WezTerm.app";
          "alt-a" = "exec-and-forget open -n /Applications/Arc.app";
          "alt-slash" = "layout tiles horizontal vertical";
          "alt-comma" = "layout accordion horizontal vertical";
          "alt-h" = "focus left";
          "alt-j" = "focus down";
          "alt-k" = "focus up";
          "alt-l" = "focus right";
          "alt-shift-h" = "move left";
          "alt-shift-j" = "move down";
          "alt-shift-k" = "move up";
          "alt-shift-l" = "move right";
          "alt-shift-f" = "fullscreen";
          "alt-shift-space" = "layout floating tiling";
          "alt-1" = "workspace 1";
          "alt-2" = "workspace 2";
          "alt-3" = "workspace 3";
          "alt-4" = "workspace 4";
          "alt-5" = "workspace 5";
          "alt-shift-1" = "move-node-to-workspace 1";
          "alt-shift-2" = "move-node-to-workspace 2";
          "alt-shift-3" = "move-node-to-workspace 3";
          "alt-shift-4" = "move-node-to-workspace 4";
          "alt-shift-5" = "move-node-to-workspace 5";
          "alt-shift-c" = "reload-config";
          "alt-shift-r" = "mode resize";
        };
      };
      resize = {
        binding = {
          "h" = "resize width -50";
          "j" = "resize height +50";
          "k" = "resize height -50";
          "l" = "resize width +50";
          "b" = "balance-sizes";
          "minus" = "resize smart -50";
          "equal" = "resize smart +50";
          "enter" = "mode main";
          "esc" = "mode main";
          "alt-shift-semicolon" = "mode service";
        };
      };
      service = {
        binding = {
          "esc" = ["reload-config" "mode main"];
          "r" = ["flatten-workspace-tree" "mode main"];
          "f" = ["layout floating tiling" "mode main"];
          "backspace" = ["close-all-windows-but-current" "mode main"];
          "alt-shift-h" = ["join-with left" "mode main"];
          "alt-shift-j" = ["join-with down" "mode main"];
          "alt-shift-k" = ["join-with up" "mode main"];
          "alt-shift-l" = ["join-with right" "mode main"];
        };
      };
    };
    # on-window-detected = [
    #   { condition = { appId = "company.thebrowser.Browser"; }; run = "move-node-to-workspace 1"; }
    #   { condition = { appId = "com.apple.Safari"; }; run = "move-node-to-workspace 1"; }
    #   { condition = { appId = "com.mitchellh.ghostty"; }; run = "move-node-to-workspace 2"; }
    #   { condition = { appId = "net.kovidgoyal.kitty"; }; run = "move-node-to-workspace 2"; }
    #   { condition = { appId = "com.hnc.DiscordPTB"; }; run = "move-node-to-workspace 3"; }
    #   { condition = { appId = "com.apple.Music"; }; run = "move-node-to-workspace 0"; }
    #   { condition = { appId = "com.spotify.client"; }; run = "move-node-to-workspace 0"; }
    #   { condition = { appId = "com.apple.finder"; }; run = "layout floating"; }
    # ];
  };
 };
}
