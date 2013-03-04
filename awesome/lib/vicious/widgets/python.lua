---------------------------------------------------
-- Licensed under the GNU General Public License v2
--  * (c) 2010, Adrian C. <anrxc@sysphere.org>
---------------------------------------------------

-- {{{ Grab environment
local tonumber = tonumber
local io = { popen = io.popen }
local setmetatable = setmetatable
local string = { gmatch = string.gmatch }
local helpers = require("vicious.helpers")
-- }}}


module("vicious.widgets.python")


local function worker(format, warg)
    if not warg then return end

    local python_state= {
        ["{info}"]  = "N/A",
    }

    local f = io.popen(warg)

    for line in f:lines() do
	    python_state["{info}"] = helpers.escape(line) 
    end
    f:close()

    return python_state
end
-- }}}

setmetatable(_M, { __call = function(_, ...) return worker(...) end })
