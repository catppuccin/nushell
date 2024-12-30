let theme = {
  rosewater: "#dc8a78"
  flamingo: "#dd7878"
  pink: "#ea76cb"
  mauve: "#8839ef"
  red: "#d20f39"
  maroon: "#e64553"
  peach: "#fe640b"
  yellow: "#df8e1d"
  green: "#40a02b"
  teal: "#179299"
  sky: "#04a5e5"
  sapphire: "#209fb5"
  blue: "#1e66f5"
  lavender: "#7287fd"
  text: "#4c4f69"
  subtext1: "#5c5f77"
  subtext0: "#6c6f85"
  overlay2: "#7c7f93"
  overlay1: "#8c8fa1"
  overlay0: "#9ca0b0"
  surface2: "#acb0be"
  surface1: "#bcc0cc"
  surface0: "#ccd0da"
  base: "#eff1f5"
  mantle: "#e6e9ef"
  crust: "#dce0e8"
}

$env.config.color_config = {
  separator: { fg: $theme.surface2 attr: b }
  leading_trailing_space_bg: { attr: n }
  header: $theme.text
  empty: { bg: $theme.green fg: $theme.base }
  bool: $theme.peach
  int: $theme.peach
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
  duration: $theme.text
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
  range: $theme.text
  float: $theme.text
  string: $theme.text
  nothing: $theme.text
  binary: $theme.text
  cell-path: $theme.text
  row_index: $theme.subtext1
  record: $theme.text
  list: $theme.text
  hints: $theme.surface2
  search_result: { bg: $theme.red fg: $theme.base }
  shape_closure: $theme.teal
  shape_directory: $theme.blue
  shape_externalarg: $theme.text
  shape_filepath: $theme.blue
  shape_flag: { fg: $theme.maroon attr: i }
  shape_globpattern: $theme.text
  shape_int: $theme.peach
  shape_internalcall: $theme.blue
  shape_list: $theme.overlay2
  shape_matching_brackets: { attr: u }
  shape_nothing: $theme.peach
  shape_pipe: $theme.sky
  shape_record: $theme.overlay2
  shape_string: $theme.green
  shape_string_interpolation: $theme.flamingo
  shape_raw_string: $theme.green
  shape_garbage: $theme.red
  shape_keyword: $theme.mauve
  shape_block: $theme.blue
  shape_match_pattern: $theme.green
  shape_operator: $theme.sky
  shape_table: $theme.overlay2
  shape_variable: { fg: $theme.peach attr: i }
  shape_bool: $theme.peach
  shape_signature: $theme.teal
  shape_vardecl: { fg: $theme.peach attr: i }
  shape_external: $theme.blue
  shape_range: $theme.sky
  shape_redirection: { fg: $theme.text attr: b }
  shape_float: $theme.peach
  shape_binary: $theme.peach
  shape_datetime: $theme.peach
  shape_custom: { fg: "#ff0000" bg: "#ff0000" }
  glob: { fg: "#00ff00" bg: "#00ff00" }
  shape_external_resolved: $theme.red
  shape_literal: { fg: "#ffff00" bg: "#ffff00" }
  shape_glob_interpolation: { fg: "#ff00ff" bg: "#ff00ff" }
  block: { fg: "#00ffff" bg: "#00ffff" }
}
$env.config.highlight_resolved_externals = true

