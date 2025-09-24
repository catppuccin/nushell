do {
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

  let scheme = {
    recognized_command: $theme.blue
    unrecognized_command: $theme.text
    constant: $theme.peach
    punctuation: $theme.overlay2
    operator: $theme.sky
    string: $theme.green
    virtual_text: $theme.surface2
    variable: { fg: $theme.flamingo attr: i }
    filepath: $theme.yellow
  }

  def relative-luminance [color:string] {
    let trimmed_hex = ($color | str trim | str upcase | str replace -r '^#' '')
    let rgb_color = {
      r: ($trimmed_hex | str substring 0..1 | into int -r 16)
      g: ($trimmed_hex | str substring 2..3 | into int -r 16)
      b: ($trimmed_hex | str substring 4..5 | into int -r 16)
    }

    let RsRGB = $rgb_color.r / 255
    let GsRGB = $rgb_color.g / 255
    let BsRGB = $rgb_color.b / 255

    def rgb-to-L [rgb:float] {
      if $rgb <= 0.04045 {
        ($rgb / 12.92)
      } else {
        ((($rgb + 0.055) / 1.055) ** 2.4)
      }
    }

    let R = rgb-to-L $RsRGB
    let G = rgb-to-L $GsRGB
    let B = rgb-to-L $BsRGB

    return (0.2126 * $R + 0.7152 * $G + 0.0722 * $B)
  }

  def contrast-ratio [Ltxt:float Lbg:float] {
    return (
      if $Ltxt > $Lbg {
        (($Ltxt + 0.05) / ($Lbg + 0.05))
      } else {
        (($Lbg + 0.05) / ($Ltxt + 0.05))
      }
    )
  }

  let hex_string_rule = {||
    if not ($in =~ '^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$') {
      return $scheme.string
    } else {
      # normalize #RGB to #RRGGBB
      let hex = (if ($in | str length) == 4 {
        $in | str replace -r '^#(.)(.)(.)$' '#$1$1$2$2$3$3'
      } else { $in })

      let Ltxt = (relative-luminance $hex)
      let Lbg = (relative-luminance $theme.base)
      let L = (contrast-ratio $Ltxt $Lbg)

      return (
        if $L >= 4.5 {
          { fg: $hex }
        } else {
          { fg: $theme.text, bg: $hex }
        }
      )
    }
  }

  $env.config.color_config = {
    separator: { fg: $theme.surface2 attr: b }
    leading_trailing_space_bg: { fg: $theme.lavender attr: u }
    header: { fg: $theme.text attr: b }
    row_index: $scheme.virtual_text
    record: $theme.text
    list: $theme.text
    hints: $scheme.virtual_text
    search_result: { fg: $theme.base bg: $theme.yellow }
    shape_closure: $theme.teal
    closure: $theme.teal
    shape_flag: { fg: $theme.maroon attr: i }
    shape_matching_brackets: { attr: u }
    shape_garbage: $theme.red
    shape_keyword: $theme.mauve
    shape_match_pattern: $theme.green
    shape_signature: $theme.teal
    shape_table: $scheme.punctuation
    cell-path: $scheme.punctuation
    shape_list: $scheme.punctuation
    shape_record: $scheme.punctuation
    shape_vardecl: $scheme.variable
    shape_variable: $scheme.variable
    empty: { attr: n }
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
    shape_external: $scheme.unrecognized_command
    shape_internalcall: $scheme.recognized_command
    shape_external_resolved: $scheme.recognized_command
    shape_block: $scheme.recognized_command
    block: $scheme.recognized_command
    shape_custom: $theme.pink
    custom: $theme.pink
    background: $theme.base
    foreground: $theme.text
    cursor: { bg: $theme.rosewater fg: $theme.base }
    shape_range: $scheme.operator
    range: $scheme.operator
    shape_pipe: $scheme.operator
    shape_operator: $scheme.operator
    shape_redirection: $scheme.operator
    glob: $scheme.filepath
    shape_directory: $scheme.filepath
    shape_filepath: $scheme.filepath
    shape_glob_interpolation: $scheme.filepath
    shape_globpattern: $scheme.filepath
    shape_int: $scheme.constant
    int: $scheme.constant
    bool: $scheme.constant
    float: $scheme.constant
    nothing: $scheme.constant
    binary: $scheme.constant
    shape_nothing: $scheme.constant
    shape_bool: $scheme.constant
    shape_float: $scheme.constant
    shape_binary: $scheme.constant
    shape_datetime: $scheme.constant
    shape_literal: $scheme.constant
    string: $hex_string_rule
    shape_string: $scheme.string
    shape_string_interpolation: $theme.flamingo
    shape_raw_string: $scheme.string
    shape_externalarg: $scheme.string
  }
  $env.config.highlight_resolved_externals = true
  $env.config.explore = {
      status_bar_background: { fg: $theme.text, bg: $theme.mantle },
      command_bar_text: { fg: $theme.text },
      highlight: { fg: $theme.base, bg: $theme.yellow },
      status: {
          error: $theme.red,
          warn: $theme.yellow,
          info: $theme.blue,
      },
      selected_cell: { bg: $theme.blue fg: $theme.base },
  }
}
