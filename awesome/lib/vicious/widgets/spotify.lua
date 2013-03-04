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


module("vicious.widgets.spotify")


local function worker(format, warg)
    local spotify_state= {
        ["{info}"]  = "N/A",
    }

    local f = io.popen("spotify_info.py")

    for line in f:lines() do
	    spotify_state["{info}"] = helpers.escape(line) 
    end
    f:close()

    return spotify_state
end
-- }}}

setmetatable(_M, { __call = function(_, ...) return worker(...) end })
