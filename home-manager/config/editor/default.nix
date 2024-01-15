{ config, pkgs, ...}: {
        
	programs.nixvim = {
		enable = true;
		colorschemes.oxocarbon.enable = true;
                plugins = {
                  bufferline.enable = true;
                  lsp.enable = false;

                  harpoon = {
                    enable = true;
                    keymaps = {
                      addFile = "<leader>ha";
                      toggleQuickMenu = "<leader>hm";
                    };
                  };
                 telescope = {
                   enable = true;

                   defaults.file_ignore_patterns = [ "^.git/" ];
                 };

                  oil.enable = true;
                  treesitter.enable = true;
                  clangd-extensions.enable = false;

                  nvim-cmp = {
                        enable = true;
                        autoEnableSources = true;
                        sources = [
                          {name = "nvim_lsp";}
                          {name = "path";}
                          {name = "buffer";}
                          {name = "luasnip";}
                        ];

                        mapping = {
                          "<CR>" = "cmp.mapping.confirm({ select = true })";
                          "<Tab>" = {
                            action = ''
                              function(fallback)
                                if cmp.visible() then
                                  cmp.select_next_item()
                                elseif luasnip.expandable() then
                                  luasnip.expand()
                                elseif luasnip.expand_or_jumpable() then
                                  luasnip.expand_or_jump()
                                elseif check_backspace() then
                                  fallback()
                                else
                                  fallback()
                                end
                              end
                            '';
                            modes = [ "i" "s" ];
                        };
                      };
                    };
                };

		globals.mapleader = " ";
		options = {
			number = true;
			relativenumber = true;

			shiftwidth = 2;
		};


                keymaps = [
                  {
                    action = "<cmd>Telescope find_files<CR>";
                    key = "<leader>ff";
                  }
                ];
                autoCmd = [
                  {
                    event = [ "BufEnter" "BufWinEnter" ];
                    pattern = [ "*.c" "*.h" ];
                    command = "echo 'Abandon all hope ye who enter'";
                  }
                 #  {
                 #    event = [ "TextYankPost" ];
                 #    pattern = ["*"];
                 #    group = "YankHighlight";
                 #    command = "silent! lua vim.highlight.on_yank()";
                 #  }
                ];

                extraPlugins = with pkgs.vimPlugins; [
                  vim-nix
                  {
                    plugin = comment-nvim;
                    config = ''lua require("Comment").setup()'';
                  }
                ];
	};
}
