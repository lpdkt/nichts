{
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;
    enableManpages = true;
    defaultEditor = true;

    settings.vim = {
      options = {
        termguicolors = true;
        nu = true;
        relativenumber = true;
        tabstop = 2;
        softtabstop = 2;
        shiftwidth = 2;
        expandtab = true;
        winborder = "rounded";
        smartindent = true;
        wrap = false;
        swapfile = false;
        backup = false;
        undofile = true;
        incsearch = true;
        hlsearch = false;
      };

      keymaps = [
        {
          key = "<leader>ft";
          mode = "n";
          action = "<cmd>Oil<CR>";
        }
        {
          key = "K";
          mode = "v";
          action = ":m '<-2<CR>gv=gv";
        }
        {
          key = "J";
          mode = "v";
          action = ":m '>+1<CR>gv=gv";
        }
        {
          key = "J";
          mode = "n";
          action = "mzJ`z";
        }
        {
          key = "<C-d>";
          mode = "n";
          action = "<C-d>zz";
        }
        {
          key = "<C-j>";
          mode = "n";
          action = "<C-j>zz";
        }
        {
          key = "n";
          mode = "n";
          action = "nzzzv";
        }
        {
          key = "N";
          mode = "n";
          action = "Nzzzv";
        }
        {
          key = "<leader>p";
          mode = "x";
          action = ''"_dP'';
        }
        {
          key = "<leader>y";
          mode = [
            "n"
            "v"
          ];
          action = ''"+y'';
        }
        {
          key = "<leader>Y";
          mode = "n";
          action = ''"+Y'';
        }
        {
          key = "<leader>d";
          mode = [
            "n"
            "v"
          ];
          action = ''"_d'';
        }
        {
          key = "Q";
          mode = "n";
          action = "<nop>";
        }
        {
          key = "<leader>x";
          mode = "n";
          silent = true;
          action = "<cmd>!chmod +x %<CR>";
        }
      ];

      lsp = {
        enable = true;
        mappings = {
          format = "<leader>lf";
          hover = "K";
          openDiagnosticFloat = "<leader>k";
          goToDefinition = "gd";
          goToDeclaration = "gD";
          listImplementations = "gi";
          listReferences = "gr";
          nextDiagnostic = "[d";
          previousDiagnostic = "]d";
          renameSymbol = "<leader>rn";
          listWorkspaceSymbols = "<leader>ws";
          codeAction = "<leader>ca";
          signatureHelp = "<C-h";
        };

        servers = {
          nixd.settings.nixd.options =
            let
              flake = ''(builtins.getFlake "/home/leroy/nichts")'';
            in
            {
              nixos = {
                expr = "${flake}.nixosConfigurations.noise.options";
              };
              home_manager = {
                expr = "${flake}.nixosConfigurations.noise.options.home-manager.users.type.getSubOptions []";
              };
            };
        };
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix = {
          enable = true;
          lsp.servers = [ "nixd" ];
          format.type = [ "nixfmt" ];
        };
        go.enable = true;
        clang.enable = true;
        python.enable = true;
        rust.enable = true;
        bash.enable = true;
        zig.enable = true;
        typescript.enable = true;
        css.enable = true;
        html.enable = true;
        typst.enable = true;
        markdown = {
          enable = true;
          extensions = {
            render-markdown-nvim.enable = true;
          };
        };
      };

      treesitter = {
        autotagHtml = true;
        addDefaultGrammars = true;
        grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          json
          toml
          yaml
          make
          diff
          regex
          ini
        ];
      };

      autocomplete.nvim-cmp = {
        enable = true;
        sources = {
          "nvim_lsp" = "[LSP]";
        };

        mappings = {
          confirm = "<CR>";
          next = "<C-n>";
          previous = "<C-p>";
          complete = "<C-Space>";
          close = "<C-e>";
        };
      };

      theme = {
        enable = true;
        name = "tokyonight";
        transparent = true;
        style = "night";
      };

      visuals = {
        nvim-web-devicons.enable = true;
      };

      ui = {
        borders = {
          enable = true;
          plugins = {
            nvim-cmp = {
              enable = true;
              style = "rounded";
            };
          };
        };
        colorizer.enable = true;
      };

      statusline.lualine.enable = true;
      comments.comment-nvim.enable = true;
      autopairs.nvim-autopairs.enable = true;

      utility.oil-nvim.enable = true;

      telescope = {
        enable = true;
        mappings = {
          findFiles = "<leader>ff";
          buffers = "<leader>fb";
          liveGrep = "<leader>fg";
          diagnostics = "<leader>fd";
          findProjects = "<leader>fp";
          helpTags = "<leader>fh";
          resume = "<leader>fr";
          open = "<leader>fv";
        };
      };
    };
  };
}
