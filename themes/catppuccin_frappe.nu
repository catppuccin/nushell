let palette = {
  rosewater: "#f2d5cf"
  flamingo: "#eebebe"
  pink: "#f4b8e4"
  mauve: "#ca9ee6"
  red: "#e78284"
  maroon: "#ea999c"
  peach: "#ef9f76"
  yellow: "#e5c890"
  green: "#a6d189"
  teal: "#81c8be"
  sky: "#99d1db"
  sapphire: "#85c1dc"
  blue: "#8caaee"
  lavender: "#babbf1"
  text: "#c6d0f5"
  subtext1: "#b5bfe2"
  subtext0: "#a5adce"
  overlay2: "#949cbb"
  overlay1: "#838ba7"
  overlay0: "#737994"
  surface2: "#626880"
  surface1: "#51576d"
  surface0: "#414559"
  base: "#303446"
  mantle: "#292c3c"
  crust: "#232634"
}

$env.config.color_config = {
  separator: { fg: $theme.surface2 attr: b }
  leading_trailing_space_bg: { attr: n }
  header: $theme.text
  empty: { bg: $theme.green fg: $theme.base }
  bool: $theme.peach
  int: $theme.peach
  filesize: $theme.peach
  duration: $theme.text
  date: $theme.peach
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
  shape_flag: $theme.yellow
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
  shape_table: $theme.lavender
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
}
