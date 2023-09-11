return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local logo = [[
                    _         _
        __   ___.--'_`.     .'_`--.___   __
      ( _`.'. -   'o` )   ( 'o`   - .`.'_ )
      _\.'_'      _.-'     `-._      `_`./_
      ( \`. )    //\`         '/\\    ( .'/ )
      \_`-'`---'\\__,       ,__//`---'`-'_/
        \`        `-\         /-'        '/
        `                               ' 
    ]]
    opts.section.header.val = vim.split(logo, "\n", { trimempty = true })
  end,
}
