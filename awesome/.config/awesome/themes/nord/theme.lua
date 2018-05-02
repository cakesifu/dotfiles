local awful = require("awful")

local theme = {}
-- Working directory (where you place this theme)
theme.local_wd = awful.util.get_configuration_dir() .. "themes/nord/"
theme.walld = awful.util.get_configuration_dir() .. "themes/_walls/"
theme.wd = "/usr/share/awesome/themes/zenburn/"

theme.font = "Monospaced 8"
theme.red = "#BF616A"
theme.green = "#A3BE8C"
theme.yellow = "#EBCB8B"
theme.blue = "#5E81AC"
theme.purple = "#B48EAD"
theme.aqua = "#88C0D0"
theme.gray = "#D8DEE9"
theme.orange = "#D08770"
theme.bg = "#3B4252"
theme.bg0 = "#2E3440"
theme.bg1 = "#434C5E"
theme.bg2 = "#4C566A"
theme.fg = "#D8DEE9"
theme.fg3 = "#bdae93"

theme.bg_normal     = theme.bg
theme.bg_focus      = theme.blue
theme.bg_urgent     = theme.orange
theme.bg_minimize   = theme.yellow
theme.bg_systray    = theme.bg0

theme.fg_normal     = theme.fg
theme.fg_focus      = theme.fg
theme.fg_urgent     = theme.fg
theme.fg_minimize   = theme.bg0

theme.border_normal = theme.bg0
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

theme.taglist_shape_border_width = 2
theme.taglist_shape_border_color = theme.bg0

-- Display the taglist squares
theme.taglist_squares_sel   = theme.local_wd .. "taglist/square.png"
theme.taglist_squares_unsel = theme.local_wd .. "taglist/square.png"


-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme.wd .. "submenu.png"
theme.menu_height = 22
theme.menu_width  = 160
theme.wibar_height = 22

-- You can use your own layout icons like this:
theme.layout_fairh = theme.wd .. "layouts/fairh.png"
theme.layout_fairv = theme.wd .. "layouts/fairv.png"
theme.layout_floating  = theme.wd .. "layouts/floating.png"
theme.layout_magnifier = theme.wd .. "layouts/magnifier.png"
theme.layout_max = theme.wd .. "layouts/max.png"
theme.layout_fullscreen = theme.wd .. "layouts/fullscreen.png"
theme.layout_tilebottom = theme.wd .. "layouts/tilebottom.png"
theme.layout_tileleft   = theme.wd .. "layouts/tileleft.png"
theme.layout_tile = theme.wd .. "layouts/tile.png"
theme.layout_tiletop = theme.wd .. "layouts/tiletop.png"
theme.layout_spiral  = theme.wd .. "layouts/spiral.png"
theme.layout_dwindle = theme.wd .. "layouts/dwindle.png"
theme.layout_cornernw = theme.wd .. "layouts/cornernw.png"
theme.layout_cornerne = theme.wd .. "layouts/cornerne.png"
theme.layout_cornersw = theme.wd .. "layouts/cornersw.png"
theme.layout_cornerse = theme.wd .. "layouts/cornerse.png"

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
  theme.walld .. "wall_dark_01.png",
  theme.walld .. "wall_dark_02.jpg",
  theme.walld .. "wall_dark_03.jpg",
  theme.walld .. "wall_dark_04.jpg",
  theme.walld .. "wall_dark_05.png",
  theme.walld .. "wall_dark_06.jpg",
  theme.walld .. "wall_dark_07.jpg",
  theme.walld .. "wall_dark_08.jpg"
}
theme.default_bg = theme.bg0

math.randomseed(os.clock() * 100000000000)
theme.wallpaper = function(s)
  return walls[math.random(1, #walls)]
end

return theme
