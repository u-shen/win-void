-----------------------------------------------------------
-- Blink cmp Completions:
-----------------------------------------------------------
return {
  "saghen/blink.cmp",
  event = { 'InsertEnter', 'CmdlineEnter' },
  version = "*",
  opts = {
    cmdline = {
      completion = {
        menu = {
          auto_show = true,
        },
      },
      keymap = {
        preset = "none",
        ["<CR>"] = { "select_accept_and_enter", "fallback" },
        ["<Tab>"] = { "select_accept_and_enter", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<c-k>"] = { "select_prev", "fallback" },
        ["<c-j>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "hide", "fallback" },
        ['<C-n>'] = { 'show' },
      },
    },
    keymap = {
      preset = "enter",
      ["<CR>"] = {},
      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<S-k>"] = { "scroll_documentation_up", "fallback" },
      ["<S-j>"] = { "scroll_documentation_down", "fallback" },
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-n>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<C-p>"] = { "hide", "fallback" },
    },

    completion = {
      list = {
        max_items = 10,
        selection = {
          preselect = true,
          auto_insert = true,
        }
      },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        scrollbar = false,
        auto_show = true,
        min_width = 25,
        border = {
          { "󱐋", "WarningMsg" },
          "─",
          "╮",
          "│",
          "╯",
          "─",
          "╰",
          "│",
        },
        winhighlight = "Normal:Normal,CursorLine:CursorLine",
        draw = {
          treesitter = { "lsp", "snippets" },
          columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind", gap = 1 } },
          components = {
            kind = {
              text = function(ctx)
                local len = 10 - string.len(ctx.kind)
                local space = string.rep(" ", len)
                return ctx.kind .. space .. '[' .. ctx.source_name .. ']'
              end
            }
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        window = {
          winhighlight = "Normal:Normal,CursorLine:CursorLine",
          desired_min_height = 30,
          max_width = 90,
          min_width = 40,
          border = {
            { "", "DiagnosticHint" },
            "─",
            "╮",
            "│",
            "╯",
            "─",
            "╰",
            "│",
          },
        },
      },
      ghost_text = {
        enabled = false,
      },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
      kind_icons = {
        Text = '',
        Method = '󰊕',
        Function = '󰊕',
        Constructor = '',
        Field = '󰜢',
        Variable = '',
        Class = '',
        Interface = '',
        Module = '',
        Property = '',
        Unit = '',
        Value = '',
        Enum = '',
        Keyword = '󱕴',
        Snippet = '',
        Color = '',
        File = '',
        Reference = '',
        Folder = '',
        EnumMember = '',
        Constant = '󰏿',
        Struct = '',
        Event = '',
        Operator = '',
        TypeParameter = '',
        Boolean = ' ',
        Array = ' ',
      },
    },
    sources = {
      default = { 'lsp', 'path', 'buffer' },
    },
    signature = {
      enabled = true,
      window = {
        border = {
          { "", "DiagnosticHint" },
          "─",
          "╮",
          "│",
          "╯",
          "─",
          "╰",
          "│",
        },
        winhighlight = "Normal:Normal,CursorLine:CursorLine",
      },
    },
  },
  opts_extend = { "sources.default" },
}
