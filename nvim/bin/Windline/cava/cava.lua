local cava_text = "OK"

local bars = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
local create_cava_colors = function(colors)
    local HSL = require('wlanimation.utils')
    local d_colors = {
        "green_light", "blue", "yellow_light", "magenta_light", "red",
    }
    local cava_colors = HSL.rgb_to_hsl(colors[d_colors[math.random(#d_colors)]]):shades(10, 8)
    for i = 1, 8, 1 do
        colors["cava" .. i] = cava_colors[i]:to_rgb()
    end
    return colors
end
local cava_comp = {
    name = "cava",
    hl_colors = {
        cava1 = { "cava1", "NormalBg" },
        cava2 = { "cava2", "NormalBg" },
        cava3 = { "cava3", "NormalBg" },
        cava4 = { "cava4", "NormalBg" },
        cava5 = { "cava5", "NormalBg" },
        cava6 = { "cava6", "NormalBg" },
        cava7 = { "cava7", "NormalBg" },
        cava8 = { "cava8", "NormalBg" },
    },
    text = function()
        local result = {}
        for i = 1, 40, 2 do
            local c = tonumber(cava_text:sub(i, i))
            if c then
                c = c + 1
                result[#result + 1] = { bars[c], "cava" .. c }
            end
        end
        return result
    end,
    click = function()
        vim.notify("change cava colors")
        windline.change_colors(create_cava_colors(windline.get_colors()))
    end
}

local uv = vim.loop

if _G._cava_stop then
    _G._cava_stop()
end
local function run_cava()
    local cava_path = "$HOME/.config/nvim/bin/Lualine/cava/cava.sh"
    local stdin = uv.new_pipe(false)
    local stdout = uv.new_pipe(false)
    local stderr = uv.new_pipe(false)
    local handle = uv.spawn(cava_path,
        { stdio = { stdin, stdout, stderr }, }, function()
        _G._cava_stop()
    end)

    uv.read_start(stdout, vim.schedule_wrap(function(err, data)
        if data then
            cava_text = data
        end
    end))
    _G._cava_stop = function()

        stdin:read_stop()
        stdin:close()
        stdout:read_stop()
        stdout:close()
        stderr:read_stop()
        stderr:close()

        handle:close()
        _G._cava_stop = nil
    end

end

run_cava()

windline.remove_component(cava_comp)

windline.remove_component(cava_comp)
windline.add_component(cava_comp, {
    name = "cava",
    position = "right",
    colors_name = function(colors)
        return create_cava_colors(colors)
    end
})


local animation = require('wlanimation')
animation.stop_all()

local effects = require('wlanimation.effects')

animation.animation({
    data = {
        { 'cava1', effects.rainbow(1) },
        { 'cava2', effects.rainbow(2) },
        { 'cava3', effects.rainbow(3) },
        { 'cava4', effects.rainbow(4) },
        { 'cava5', effects.rainbow(5) },
        { 'cava6', effects.rainbow() },
        { 'cava7', effects.rainbow() },
        { 'cava8', effects.rainbow() },
    },

    timeout = nil,
    delay = 200,
    interval = 150,
})
