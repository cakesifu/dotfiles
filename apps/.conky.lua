options = require('./conky_options')

colors = {
  yellow = "b58900",
  orange = "cb4b16",
  red = "dc322f",
  blue = "268bd2",
  green = "859900",
  magenta = "6c71c4"
}

function colored(text, color)
  return "${color " .. colors[color] .."}" .. text .. "${color}"
end

function uncolored(text)
  return "${color}" .. text
end

function separator(separator)
  if not separator then
    separator = "|"
  end
  return colored(" " .. separator .. " ", "magenta")
end

function label(label, separator)
  out = colored(label .. ": ", "magenta")
  return out
end

function graph(graph)
  size = "10,40"
  if options.graph_size then
    size = options.graph_size
  end
  return string.format("${" .. graph .. "}", size)
end

function uptime(color)
  return colored("$uptime", color)
end

function sysload(color)
  return colored("$loadavg " .. graph("loadgraph %s"), "yellow")
end

function cpu(color)
  out = "${cpu cpu0}% " .. graph("cpugraph cpu0 %s")
  out = out .. " ${top name 1}${top cpu 1}"
  return colored(out, color)
end

function io(color)
  out = "${diskio_read} ${diskio_write} " .. graph("diskiograph %s")
  out = out .. " ${top_io name 1}"
  return colored(out, color)
end

function mem(color)
  out = colored("${mem} / ", color) .. uncolored("${memmax} ")
  out = out .. colored(graph("memgraph %s"), color)
  out = out .. colored(" ${top_mem name 1}${top_mem mem 1}", color)
  return  out
end

function network(card, color)
  out = label(card) .. colored("${addr " .. card .. "}", color)
  out = out .. "${if_match \"${addr " .. card .. "}\" != \"No Address\"}"
  upspeed = string.format("${upspeed %s} ${upspeedgraph %s 10,30}", card, card)
  downspeed = string.format("${downspeed %s} ${downspeedgraph %s 10,30}", card, card)
  out = out .. label(" u") .. colored(upspeed, color)
  out = out .. label(" d") .. colored(downspeed, color)
  out = out .. "${endif}"
  return out
end

function conky_bar()
  out = ""
  if options.show_uptime then
    out = out .. label("uptime") .. uptime("yellow") .. separator()
  end
  out = out .. label("load") .. sysload("yellow") .. separator()
  out = out .. label("cpu") .. cpu("orange") .. separator()
  out = out .. label("io") .. io("blue") .. separator()
  out = out .. label("mem") .. mem("red") .. separator()
  for i = 1, #options.network_cards do
    if i > 1 then
      out = out .. separator()
    end
    out = out .. network(options.network_cards[i], "green")
  end
  return out
end

