-- nodaysidle Machina — Hyprland Configuration (Lua)
-- Industrial Titanium & Liquid Mercury Monolith

local active_border_color = {
  colors = {
    "rgb(e2e8f0)", -- Liquid Silver
    "rgb(94a3b8)", -- Brushed Titanium
    "rgb(cbd5e1)", -- Platinum
    "rgb(475569)", -- Darkened Graphite Slate
  },
  angle = 135,
}

local inactive_border_color = {
  colors = {
    "rgb(1f242d)", -- Carbon Frame
    "rgb(0e1013)", -- Obsidian Depth
  },
  angle = 90,
}

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
    gaps_in = 4,
    gaps_out = { top = 4, right = 8, bottom = 8, left = 8 },
    border_size = 2,
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
      border_locked_active = active_border_color,
      border_locked_inactive = inactive_border_color,
    },

    groupbar = {
      col = {
        active = "rgba(226, 232, 240, 0.22)",
        inactive = "rgba(14, 16, 19, 0.85)",
      },
      text_color = "rgb(f8fafc)",
      text_color_inactive = "rgba(148, 163, 184, 0.65)",
      blur = true,
      gradient_rounding = 4,
    },
  },

  decoration = {
    rounding = 8,
    rounding_power = 2.5,

    active_opacity = 0.98,
    inactive_opacity = 0.88,

    dim_inactive = true,
    dim_strength = 0.15,
    dim_special = 0.25,

    blur = {
      enabled = true,
      size = 4,
      passes = 2,
      noise = 0.01,
      contrast = 1.0,
      brightness = 0.95,
      vibrancy = 0.1,
      new_optimizations = true,
    },

    shadow = {
      enabled = true,
      range = 14,
      render_power = 2,
      color = "rgba(0, 0, 0, 0.55)",
    },
  },
})

-- Precision Glide Curve
hl.curve("machinaGlide", { type = "bezier", points = { { 0.16, 1.00 }, { 0.30, 1.00 } } })

hl.animation({ leaf = "borderangle", enabled = false })
hl.animation({
  leaf = "windows",
  enabled = true,
  speed = 3.2,
  bezier = "machinaGlide",
})

hl.animation({ leaf = "layersIn", enabled = true, speed = 2.5, bezier = "machinaGlide", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2.0, bezier = "machinaGlide", style = "fade" })

o.window({ tag = "terminal" }, { tag = "-default-opacity", opacity = "0.98 0.90" })
o.window({ tag = "default-opacity" }, { opacity = "0.98 0.90" })
o.window({ class = "com.mitchellh.ghostty" }, { opacity = "0.98 0.90" })
o.window({ initialTitle = "Herdr" }, { opacity = "0.98 0.90" })

hl.layer_rule({ match = { namespace = "^(omarchy-bar|omarchy-notifications|omarchy-osd|omarchy-reminders)$" }, blur = true })
