let theme = {
  rosewater: "#f4dbd6"
  flamingo: "#f0c6c6"
  pink: "#f5bde6"
  mauve: "#c6a0f6"
  red: "#ed8796"
  maroon: "#ee99a0"
  peach: "#f5a97f"
  yellow: "#eed49f"
  green: "#a6da95"
  teal: "#8bd5ca"
  sky: "#91d7e3"
  sapphire: "#7dc4e4"
  blue: "#8aadf4"
  lavender: "#b7bdf8"
  text: "#cad3f5"
  subtext1: "#b8c0e0"
  subtext0: "#a5adcb"
  overlay2: "#939ab7"
  overlay1: "#8087a2"
  overlay0: "#6e738d"
  surface2: "#5b6078"
  surface1: "#494d64"
  surface0: "#363a4f"
  base: "#24273a"
  mantle: "#1e2030"
  crust: "#181926"
}

let scheme = {
  recognized_command: $theme.blue
  unrecognized_command: $theme.text
  constant: $theme.peach
  punctuation: $theme.overlay2
  operator: $theme.sky
  string: $theme.green
  virtual_text: $theme.surface2
  variable: { fg: $theme.flamingo attr: i }
}

$env.config.color_config = {
  separator: { fg: $theme.surface2 attr: b }
  leading_trailing_space_bg: { attr: n }
  header: { fg: $theme.text attr: b }
  empty: { attr: n }
  bool: $scheme.constant
  int: $scheme.constant
  filesize: {||
    if $in < 1kb {
      $theme.teal
    } else if $in < 10kb {
      $theme.green
    } else if $in < 100kb {
      $theme.yellow
    } else if $in < 10mb {
      $theme.peach
    } else if $in < 100mb {
      $theme.maroon
    } else if $in < 1gb {
      $theme.red
    } else {
      $theme.mauve
    }
  }
  duration: {||
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
  row_index: $scheme.virtual_text
  record: $theme.text
  list: $theme.text
  hints: $scheme.virtual_text
  search_result: { attr: u }
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
  shape_variable: $scheme.variable
  shape_bool: $scheme.constant
  shape_signature: $theme.teal
  shape_vardecl: $scheme.variable
  shape_external: $scheme.unrecognized_command
  shape_range: $scheme.operator
  shape_redirection: $scheme.operator
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
