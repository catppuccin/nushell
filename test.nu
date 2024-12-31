[one two three] | each {|c|
  if ($c == {|a, b| $a + $b}) {
   "closure"
    1 in [1]; 1 not-in [2]; "hello" starts-with "he"; true and false; false or false;
    help commands | where category == filters
  } else if ($c in [r#'hello world'#, "green", $"greetings, (name)"]) {
    "string literals"
    1 bit-or 1 bit-and 1 bit-xor 1
  } else if ($c in [1.41, 1, 100, true, false, null, 0x[ffffff]]) {
    1 + 1 - 1 * 1 / 1 // (1 mod 1) ** 1
    "constants"
  } else if ($c in [100ns, 10us, 14ms, 20sec, 10min, 45hr, 10day, 10wk]) {
    "duration"
  } else if ($c in [10B, 10kB, 10MB, 10GB, 10TB, 10PB, 10EB]) {
    "filesize"
  } else if ($c in [1.., 10..100, -4..45]) {
    "range"
  } else if ($c in [[column1, column2]; [Value1, Value2] [Value3 Value4]]) {
    "table literal"
  } else if ($c in [ { name: "Sam", rank: 10 }, { name: "Bob", rank: 7 } ]) {
    let x = 0
    mut z = 0
    loop { if $x > 10 { break }; $x = $x + 1 }
    while $x < 10 { $x = $x + 1 }

    "list of records"
  } else if ($c in [ $env.HELLO_WORLD, $env.config.color_config ] ) {
    "field accessors"
  } else {
    [one two three] | each {|c|
      match $c {
        "black" => "classy"
        "red" | "green" | "blue" => "fundamental"
        "yellow" | "purple" => "vibrant"
        _ => "innovative"
      }
    }
  }
}
