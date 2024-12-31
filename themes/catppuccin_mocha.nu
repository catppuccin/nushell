let theme = {
  rosewater: "#f5e0dc"
  flamingo: "#f2cdcd"
  pink: "#f5c2e7"
  mauve: "#cba6f7"
  red: "#f38ba8"
  maroon: "#eba0ac"
  peach: "#fab387"
  yellow: "#f9e2af"
  green: "#a6e3a1"
  teal: "#94e2d5"
  sky: "#89dceb"
  sapphire: "#74c7ec"
  blue: "#89b4fa"
  lavender: "#b4befe"
  text: "#cdd6f4"
  subtext1: "#bac2de"
  subtext0: "#a6adc8"
  overlay2: "#9399b2"
  overlay1: "#7f849c"
  overlay0: "#6c7086"
  surface2: "#585b70"
  surface1: "#45475a"
  surface0: "#313244"
  base: "#1e1e2e"
  mantle: "#181825"
  crust: "#11111b"
}

let scheme = {
  recognized_command: $theme.blue
  unrecognized_command: $theme.text
  constant: $theme.peach
  punctuation: $theme.overlay2
  operator: $theme.sky
  string: $theme.green
  virtual_text: $theme.surface2
}

$env.config.color_config = {
  separator: { fg: $theme.surface2 attr: b }
  leading_trailing_space_bg: { attr: n }
  header: { fg: $theme.text attr: b }
  empty: { attr: n }
  bool: $scheme.constant
  int: $scheme.constant
  filesize: {|fsize|
    if $fsize < 1kb {
      $theme.teal
    } else if $fsize < 10kb {
      $theme.green
    } else if $fsize < 100kb {
      $theme.yellow
    } else if $fsize < 10mb {
      $theme.peach
    } else if $fsize < 100mb {
      $theme.maroon
    } else if $fsize < 1gb {
      $theme.red
    } else {
      $theme.mauve
    }
  }
  duration: $scheme.constant
  date: {|| (date now) - $in |
    if $in < 1day {
      $theme.teal
    } else if $in < 1wk {
      $theme.green
    } else if $in < 4wk {
      $theme.yellow
    } else if $in < 12wk {
      $theme.peach
    } else if $in < 24wk {
      $theme.maroon
    } else if $in < 52wk {
      $theme.red
    } else {
      $theme.mauve
    }
  }
  background: $theme.base
  foreground: $theme.text
  range: $scheme.operator
  float: $scheme.constant
  string: $scheme.string
  nothing: $scheme.constant
  binary: $scheme.constant
  cell-path: $scheme.punctuation
  row_index: $theme.subtext1
  record: $theme.text
  list: $theme.text
  hints: $scheme.virtual_text
  search_result: { attr: r }
  shape_closure: $theme.teal
  shape_directory: $theme.blue
  shape_externalarg: $theme.text
  shape_filepath: $theme.blue
  shape_flag: { fg: $theme.maroon attr: i }
  shape_globpattern: $theme.text
  shape_int: $scheme.constant
  shape_internalcall: $scheme.recognized_command
  shape_list: $scheme.punctuation
  shape_matching_brackets: { attr: u }
  shape_nothing: $scheme.constant
  shape_pipe: $scheme.operator
  shape_record: $scheme.punctuation
  shape_string: $scheme.string
  shape_string_interpolation: $theme.flamingo
  shape_raw_string: $scheme.string
  shape_garbage: $theme.red
  shape_keyword: $theme.mauve
  shape_block: $theme.blue
  shape_match_pattern: $theme.green
  shape_operator: $scheme.operator
  shape_table: $scheme.punctuation
  shape_variable: { fg: $theme.peach attr: i }
  shape_bool: $scheme.constant
  shape_signature: $theme.teal
  shape_vardecl: { fg: $theme.peach attr: i }
  shape_external: $scheme.unrecognized_command
  shape_range: $scheme.operator
  shape_redirection: { fg: $theme.text attr: b }
  shape_float: $scheme.constant
  shape_binary: $scheme.constant
  shape_datetime: $scheme.constant
  shape_external_resolved: $scheme.recognized_command
  shape_custom: { fg: "#ff0000" bg: "#ff0000" }
  glob: { fg: "#00ff00" bg: "#00ff00" }
  shape_literal: { fg: "#ffff00" bg: "#ffff00" }
  shape_glob_interpolation: { fg: "#ff00ff" bg: "#ff00ff" }
  block: { fg: "#00ffff" bg: "#00ffff" }
}
