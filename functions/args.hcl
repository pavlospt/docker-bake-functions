function "parse_build_args" {
  params = [args_string]
  result = notequal(args_string, "") ? {
    for pair in [
      for arg in compact(split("--build-arg ", args_string)) :
      trim(arg, " \t\n\r")
      if notequal(trim(arg, " \t\n\r"), "")
    ] :
      split("=", pair)[0] =>
      join("=", slice(split("=", pair), 1, length(split("=", pair))))
  } : {}
}
