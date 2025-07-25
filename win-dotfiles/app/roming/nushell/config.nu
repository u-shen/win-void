# =============================================================================== #
# Nushell Config Shell:                                                           #
# =============================================================================== #
# =============================================================================== #
# Everblush theme:                                                                #
# =============================================================================== #
let base00 = "#141b1e"
let base01 = "#232a2d"
let base02 = "#383838"
let base03 = "#585858"
let base04 = "#b8b8b8"
let base05 = "#d8d8d8"
let base06 = "#b3b9b8"
let base07 = "#dadada"
let base08 = "#e57474"
let base09 = "#dc9656"
let base0a = "#e5c76b"
let base0b = "#8ccf7e"
let base0c = "#67b0e8"
let base0d = "#6cbfbf"
let base0e = "#c47fd5"
let base0f = "#a16946"
let base16_theme = {
    separator: $base03
    leading_trailing_space_bg: $base04
    header: $base0b
    date: $base0e
    filesize: $base0d
    row_index: $base0c
    bool: $base08
    int: $base0b
    duration: $base08
    range: $base08
    float: $base08
    string: $base04
    nothing: $base08
    binary: $base08
    cellpath: $base08
    hints: dark_gray
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
    shape_bool: $base0d
    shape_int: { fg: $base0e attr: b}
    shape_float: { fg: $base0e attr: b}
    shape_range: { fg: $base0a attr: b}
    shape_internalcall: { fg: $base0c attr: b}
    shape_external: $base0c
    shape_externalarg: { fg: $base0b attr: b}
    shape_literal: $base0d
    shape_operator: $base0a
    shape_signature: { fg: $base0b attr: b}
    shape_string: $base0b
    shape_filepath: $base0d
    shape_globpattern: { fg: $base0d attr: b}
    shape_variable: $base0e
    shape_flag: { fg: $base0d attr: b}
    shape_custom: {attr: b}
}
# =============================================================================== #
# General config File:                                                            #
# =============================================================================== #
$env.config = {
  color_config: $base16_theme
  show_banner: false
  float_precision: 2
  use_ansi_coloring: true
  edit_mode: vi
  error_style: "fancy"
  cursor_shape: {
    vi_normal: block
    vi_insert: block
    emacs: line
  }
  ls: {
      use_ls_colors: true
      clickable_links: false
  }
  rm: {
      always_trash: true
  }
  table: {
    mode: heavy
    index_mode: always
    show_empty: true
    padding: { left: 1 right: 1 }
    trim: {
        methodology: wrapping
        wrapping_try_keep_words: true
        truncating_suffix: "..."
    }
    header_on_separator: false
  }
  explore: {
      status_bar_background: {fg: "#141b1e", bg: "#dadada"},
      command_bar_text: {fg: "#dadada"},
      highlight: {fg: "black", bg: "yellow"},
      status: {
          error: {fg: "white", bg: "red"},
          warn: {}
          info: {}
      },
      table: {
          split_line: {fg: "#232a2d"},
          selected_cell: {bg: light_blue},
          selected_row: {},
          selected_column: {},
      },
  }
  history: {
      max_size: 100_000
      sync_on_enter: true
      file_format: "sqlite"
      isolation: true
  }
  completions: {
      case_sensitive: false
      quick: true
      partial: true
      algorithm: "prefix"
      external: {
          enable: true
          max_results: 100
          completer: null
      },
      use_ls_colors: true
  }
  menus: [
   {
    name: completion_menu
    only_buffer_difference: false
    marker: "󱓇 "
    type: {
      layout: columnar
      columns: 4
      col_width: 20
      col_padding: 2
    }
    style: {
      text: { fg: "#b3b9b8" }
      selected_text: { fg: "#141b1e" bg: "#8ccf7e" attr: b}
      description_text: { fg: "#e5c76b" }
      match_text: { attr: b }
      selected_match_text: { attr: br }
    }
  }
  ]
  keybindings: [
  {
    name: clear_current_line
    modifier: control
    keycode: char_u
    mode: [emacs, vi_normal, vi_insert]
    event: { edit: clear }
  }
  {
      name: open_command_editor
      modifier: none
      keycode: char_v
      mode: [vi_normal]
      event: { send: openeditor }
  }
  {
    name: fuzzy_change_directory
    modifier: alt
    keycode: char_c
    mode: [emacs, vi_normal, vi_insert]
    event: { send: executehostcommand, cmd: 'cd (fd -t d -E .git -E node_modules
        | fzf --preview "eza --icons --tree {}")' }
  }
  {
    name: fuzzy_history
    modifier: control
    keycode: char_r
    mode: [emacs, vi_normal, vi_insert]
    event: [
     {
       send: ExecuteHostCommand
       cmd: "commandline edit --insert (
         history
           | get command
           | reverse
           | uniq
           | str join (char -i 0)
           | fzf
             --scheme history
             --read0
             --query (commandline)
           | decode utf-8
           | str trim
       )"
     }
    ]
  }
 ]
}

# =============================================================================== #
# Prompt:                                                                         #
# =============================================================================== #
#$env.PROMPT_INDICATOR = "> "
#$env.PROMPT_INDICATOR_VI_INSERT = "> "
#$env.PROMPT_INDICATOR_VI_NORMAL = "> "
#$env.PROMPT_MULTILINE_INDICATOR = "> "
#$env.PROMPT_COMMAND_RIGHT = ""
# =============================================================================== #
# Starship Prompt:                                                                #
# =============================================================================== #
$env.STARSHIP_SHELL = "nu"
def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}
# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.PROMPT_MULTILINE_INDICATOR = ""
# =============================================================================== #
# Completer:                                                                      #
# =============================================================================== #
let carapace_completer = {|spans|
    carapace $spans.0 nushell ...$spans | from json
}
let zoxide_completer = {|spans|
    $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
}
# =============================================================================== #
# Source OF Files:                                                                #
# =============================================================================== #
source ~/.cache/carapace/init.nu
source ~/.cache/zoxide.nu
source alias.nu
