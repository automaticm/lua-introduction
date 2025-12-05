--[[
    Author: Ado
    Changes the '+' operator to act like a '*' operator
    using metamethods __add, and __tostring
]]

local function number(val)
    local num = {val = val}

    setmetatable(num,
    {
    __add = function(a, b)
        return number(a.val * b.val)
    end,
    __tostring = function(k)
        return tostring(k.val)
    end,
    })

    return num
end

local a = 4
local b = 12

print(a + b)
print(number(a) + number(b))