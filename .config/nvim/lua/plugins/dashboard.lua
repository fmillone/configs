return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function(_, opts)
    local logo = [[
                  _       _
     __   ___ .--´_`.   .´_`--.___   __
    ( _`.´. -    ´o` ) ( ´o`   - .`.´_ )
    _\.´_´       _.-´   `-._      `_`./_
    ( \`. )    //\`         ´/\\    ( .´/)
    \_`-´`---'\\__,       ,__//`---'`-´_/
      \`        `-\         /-´        ´/
      `                               ´
    ]]
    local logo2 = [[
              _         _
  __   ___.--´_`.     .´_`--.___   __
 ( _`.'. -   ´o` )   ( ´o`   - .`.'_ )
 _\.'_'      _.-'     `-._      `_`./_
( \`. )    //\`         '/\\    ( .'/ )
 \_`-'`---'\\__,       ,__//`---'`-'_/
  \`        `-\         /-'        '/
   `                               '   VK
    ]]
    logo = string.rep("\n", 8) .. logo2:sub(14) .. "\n\n"
    opts.config.header = vim.split(logo, "\n")
    opts.theme = "doom"
    -- table.insert(opts.section.buttons.val, dashboard.button("t", " Netrw", ":Explore<CR>"))
  end,
}
