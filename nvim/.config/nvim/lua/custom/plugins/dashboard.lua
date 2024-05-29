return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  opts = function()
    local logo = [[
              _         _
  __   ___.--´_`.     .´_`--.___   __
 ( _`.'. -   ´o` )   ( ´o`   - .`.'_ )
 _\.'_'      _.-'     `-._      `_`./_
( \`. )    //\`         '/\\    ( .'/ )
 \_`-'`---'\\__,       ,__//`---'`-'_/
  \`        `-\         /-'        '/
   `                               '   VK
    ]]

    logo = string.rep('\n', 8) .. logo:sub(14) .. '\n\n'
    local opts = {
      theme = 'doom',
      config = {
        header = vim.split(logo, '\n'),
        center = {
          { action = 'Telescope find_files', desc = ' Find file', icon = ' ', key = 'f' },
          { action = 'ene | startinsert', desc = ' New file', icon = ' ', key = 'n' },
          { action = 'Telescope oldfiles', desc = ' Recent files', icon = ' ', key = 'r' },
          { action = 'Telescope live_grep', desc = ' Find text', icon = ' ', key = 'g' },
          { action = 'lua require("persistence").load()', desc = ' Restore Session', icon = ' ', key = 's' },
          { action = 'Lazy', desc = ' Lazy', icon = '󰒲 ', key = 'l' },
          { action = 'qa', desc = ' Quit', icon = ' ', key = 'q' },
        },
      },
    }
    return opts
  end,
}
