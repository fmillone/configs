return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local dashboard = require("alpha.themes.dashboard")

    local logo = [[
                    _       _
       __   ___ .--´_`.   .´_`--.___   __
      ( _`.´. -    ´o` ) ( ´o`   - .`.´_ )
      _\.´_´      _.-´     `-._      `_`./_
      ( \`. )    //\`         ´/\\    ( .´/)
      \_`-´`---'\\__,       ,__//`---'`-´_/
        \`        `-\         /-´        ´/
        `                               ´
    ]]
    opts.section.header.val = vim.split(logo, "\n", { trimempty = true })
    table.insert(opts.section.buttons.val, dashboard.button("t", " Netrw", ":Explore<CR>"))
  end,
}
