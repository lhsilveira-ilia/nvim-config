return {
  htmly = {
    install_info = {
      url = "https://github.com/leandrohsilveira/tree-sitter-htmly", -- local path or git repo
      files = { "src/parser.c", "src/scanner.c" },                   -- note that some parsers also require src/scanner.c or src/scanner.cc
      -- optional entries:
      branch = "main",                                               -- default branch in case of git repo if different from master
      generate_requires_npm = true,                                  -- if stand-alone parser without npm dependencies
      requires_generate_from_grammar = false,                        -- if folder contains pre-generated src/parser.c
    },
    -- filetype = "htmly", -- if filetype does not match the parser name
  }
}
