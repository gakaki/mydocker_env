

local cjson = require "cjson"

-- default behavior
local my_json = [[{"my_array":[]}]]
local t = cjson.decode(my_json)
cjson.encode(t) -- {"my_array":{}} back to an object
