{

services.aerospace = {
  enable = true;
  settings = {
    gaps = {
      outer.left = 10;
      outer.right = 10;
      outer.bottom = 10;
      outer.top = 10;
      inner.horizontal = 5;
      inner.vertical = 5;
    };
    accordion-padding = 30;
    on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];
    on-focus-changed = [ "move-mouse window-lazy-center" ];

    mode.main.binding = {
      alt-h = "focus left";
      alt-j = "focus down";
      alt-k = "focus up";
      alt-l = "focus right";

      alt-slash = "layout tiles horizontal vertical";
      alt-comma = "layout accordion horizontal vertical";

      alt-shift-f = "fullscreen";

      alt-shift-space = "layout floating tiling";

      alt-1 = "workspace 1";
      alt-2 = "workspace 2";
      alt-3 = "workspace 3";
      alt-4 = "workspace 4";
      alt-5 = "workspace 5";

      alt-shift-1 = "move-node-to-workspace 1";
      alt-shift-2 = "move-node-to-workspace 2";
      alt-shift-3 = "move-node-to-workspace 3";
      alt-shift-4 = "move-node-to-workspace 4";
      alt-shift-5 = "move-node-to-workspace 5";

      alt-shift-c = "reload-config";
      alt-shift-r = "mode resize";
    };

    mode.service.binding = {
      esc = [
        "reload-config"
	"mode main"
      ];

      r = [
        "flatten-workspace-tree" 
        "mode main"
      ];

      f = [
        "layout floating tiling"
	"mode main"
      ];

      backspace = [
        "close-all-windows-but-current"
	"mode main"
      ];

      alt-shift-h = [
        "join-with left"
	"mode main"
      ];

      alt-shift-j = [
        "join-with down"
	"mode main"
      ];

      alt-shift-k = [
        "join-with up" 
	"mode main"
      ];
      alt-shift-l = [
        "join-with right" 
	"mode main"
      ];
    };

    #TODO: Finish
  };
};
} 
