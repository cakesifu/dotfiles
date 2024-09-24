-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.clipboard = ""

if vim.g.neovide then
  vim.o.linespace = 2.0
  vim.cmd([[
    set guicursor=a:hor15-Cursor
    set guicursor+=i:ver20-iCursor
    set guicursor+=a:blinkon200-blinkoff50
  ]])

  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  vim.cmd([[
    let g:neovide_cursor_animation_length = 0.1
    let g:neovide_cursor_trail_size = 0.5
    let g:neovide_cursor_animate_command_line = v:true
    let g:neovide_cursor_unfocused_outline_width = 0.125
    let g:neovide_cursor_vfx_mode = "ripple"
    let g:neovide_cursor_vfx_particle_lifetime = 0.75
    let g:neovide_cursor_vfx_particle_speed = 10.0
    let g:neovide_cursor_vfx_particle_density = 9.0
  ]])
end
