---@class snacks.scroll.Config
---@field animate snacks.animate.Config|{}
---@field animate_repeat snacks.animate.Config|{}|{delay:number}
return {
  animate = {
    duration = { step = 15, total = 250 },
    easing = "linear",
    fps = 240,
  },
  -- faster animation when repeating scroll after delay
  animate_repeat = {
    delay = 100, -- delay in ms before using the repeat animation
    duration = { step = 5, total = 50 },
    easing = "linear",
  },
  -- what buffers to animate
  filter = function(buf)
    return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and vim.bo[buf].buftype ~= "terminal"
  end,
}
