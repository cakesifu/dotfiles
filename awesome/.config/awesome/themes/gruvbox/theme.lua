local awful = require("awful")

local theme = {}
-- Working directory (where you place this theme)
theme.wd = awful.util.get_configuration_dir() .. "themes/gruvbox/"
theme.awesome_wd = "/usr/share/awesome/themes/zenburn/"

theme.font          = "Monospaced 8"
theme.red = "#cc241d"
theme.green = "#98971a"
theme.yellow = "#d79921"
theme.blue = "#458588"
theme.purple = "#b16286"
theme.aqua = "#689d6a"
theme.gray = "#928374"
theme.orange = "#d65d0e"
theme.bg = "#282828"
theme.bg0 = "#1d2021"
theme.bg1 = "#3c3836"
theme.bg2 = "#504945"
theme.fg = "#ebdbb2"
theme.fg3 = "#bdae93"

theme.bg_normal     = theme.bg
theme.bg_focus      = theme.blue
theme.bg_urgent     = theme.orange
theme.bg_minimize   = theme.gray
theme.bg_systray    = theme.bg

theme.fg_normal     = theme.fg
theme.fg_focus      = theme.fg
theme.fg_urgent     = theme.fg
theme.fg_minimize   = theme.fg

theme.border_normal = theme.bg2
theme.border_focus  = theme.blue
theme.border_urgent  = theme.orange
theme.border_marked = "#cc241d"

theme.useless_gap   = 3
theme.border_width  = 2

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
-- theme.taglist_bg_focus = "#ff0000"
theme.taglist_fg_normal = theme.fg
theme.taglist_fg_focus = theme.fg
theme.taglist_fg_urgent = theme.fg

theme.taglist_bg_focus = theme.blue
theme.taglist_bg_occupied = theme.bg1
theme.taglist_bg_urgent = theme.orange

theme.taglist_shape_border_width = 1
theme.taglist_shape_border_color = theme.bg0

-- Display the taglist squares
theme.taglist_squares_sel   = theme.awesome_wd .. "taglist/squarefz.png"
theme.taglist_squares_unsel = theme.awesome_wd .. "taglist/squarez.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme.wd .. "submenu.png"
theme.menu_height = 22
theme.menu_width  = 160
theme.wibar_height = 22

-- You can use your own layout icons like this:
theme.layout_fairh = theme.awesome_wd .. "layouts/fairh.png"
theme.layout_fairv = theme.awesome_wd .. "layouts/fairv.png"
theme.layout_floating  = theme.awesome_wd .. "layouts/floating.png"
theme.layout_magnifier = theme.awesome_wd .. "layouts/magnifier.png"
theme.layout_max = theme.awesome_wd .. "layouts/max.png"
theme.layout_fullscreen = theme.awesome_wd .. "layouts/fullscreen.png"
theme.layout_tilebottom = theme.awesome_wd .. "layouts/tilebottom.png"
theme.layout_tileleft   = theme.awesome_wd .. "layouts/tileleft.png"
theme.layout_tile = theme.awesome_wd .. "layouts/tile.png"
theme.layout_tiletop = theme.awesome_wd .. "layouts/tiletop.png"
theme.layout_spiral  = theme.awesome_wd .. "layouts/spiral.png"
theme.layout_dwindle = theme.awesome_wd .. "layouts/dwindle.png"
theme.layout_cornernw = theme.awesome_wd .. "layouts/cornernw.png"
theme.layout_cornerne = theme.awesome_wd .. "layouts/cornerne.png"
theme.layout_cornersw = theme.awesome_wd .. "layouts/cornersw.png"
theme.layout_cornerse = theme.awesome_wd .. "layouts/cornerse.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil
theme.notification_icon_size = 64

-- Arrows
theme.arrow0 = theme.wd .. "arrows/0.png"
theme.arrow1 = theme.wd .. "arrows/1.png"
theme.arrow2 = theme.wd .. "arrows/2.png"
theme.arrow3 = theme.wd .. "arrows/3.png"
theme.arrow4 = theme.wd .. "arrows/4.png"
theme.arrow5 = theme.wd .. "arrows/5.png"
theme.arrow6 = theme.wd .. "arrows/6.png"

local walls = {
  theme.wd .. "wall_dark_01.png",
  theme.wd .. "wall_dark_02.jpg",
  theme.wd .. "wall_dark_03.jpg",
  theme.wd .. "wall_dark_04.jpg",
  theme.wd .. "wall_dark_05.png",
  theme.wd .. "wall_dark_06.jpg",
  theme.wd .. "wall_dark_07.jpg",
  theme.wd .. "wall_dark_08.jpg"
}
theme.default_bg = theme.bg0

math.randomseed(os.clock() * 100000000000)
theme.wallpaper = function(s)
  return walls[math.random(1, #walls)]
end

return theme
