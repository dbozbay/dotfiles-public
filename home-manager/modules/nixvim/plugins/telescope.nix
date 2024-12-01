{ ... }: let
  actions = "require('telescope.actions')";
  fb_actions = "require('telescope._extensions.file_browser.actions')";
in {
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
        settings = {
          defaults = {
            layout_strategy = "horizontal";
            layout_config = {
              prompt_position = "top";
            };
            path_display = [ "smart" ];
            sorting_strategy = "ascending";
            wrap_results = true;
            
            mappings = {
              i = {
                "<esc>" = {
                  __raw = "${actions}.close";
                };
              };
            };
          };
        };

        extensions.fzf-native.enable = true;
        extensions.file-browser = {
          enable = true;
          settings = {
            hijack_netrw = true;
            theme = "dropdown";
            previewer = false;
            path = "%:p:h";
            initial_mode = "normal";
            hidden = true;
            select_buffer = true;
            grouped = true;
            hide_parent_dir = true;
            respect_gitignore = false;
            mappings = {
              n = {
                "a" = "${fb_actions}.create";
                "r" = "${fb_actions}.rename";
                "m" = "${fb_actions}.move";
                "y" = "${fb_actions}.copy";
                "d" = "${fb_actions}.remove";
                "o" = "${fb_actions}.open";
                "h" = "${fb_actions}.goto_parent_dir";
                "l" = "${actions}.select_default";
                "G" = "${fb_actions}.goto_home_dir";
                "<C-h>" = "${fb_actions}.toggle_hidden";
                "<C-f>" = "${fb_actions}.toggle_browser";
              };
            };
          };
        };

        keymaps = {
          ";f" = {
            action = "find_files";
            options = {
              desc = "Telescope Find Files";
            };
          };
          ";g" = {
            action = "git_files";
            options = {
              desc = "Telescope Git Files";
            };
          };
          ";s" = {
            action = "live_grep";
            options = {
              desc = "Live grep";
            };
          };
          ";e" = {
            action = "file_browser path=%:p:h select_buffer=true";
            options = {
              desc = "Telescope File Browser";
            };
          };

          ";r" = {
            action = "oldfiles";
            options = {
              desc = "Telescope Recent Files";
            };
          };
          ";d" = {
            action = "diagnostics";
            options = {
              desc = "Telescope Diagnostics";
            };
          };
          ";k" = {
            action = "keymaps";
            options = {
              desc = "Telescope Keymaps";
            };
          };
          ";q" = {
            action = "quickfix";
            options = {
              desc = "Telescope Quickfixs";
            };
          };
        };
      };
    };
  };
}

