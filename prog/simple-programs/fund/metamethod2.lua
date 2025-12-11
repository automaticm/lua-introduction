--[[
    Author: Ado
    Example of object oriented-like programming by
    making a table callable using __call metamethod
]]
local groot = {}

setmetatable(groot, {
    __call = function(self, ...)
        local args = {...}
        local len = #args
        if len == 0 then
            return "No one is groot."
        elseif len == 1 then
            return "I am groot!"
        elseif len == 2 then
            return "We are groot!"
        else
            return "Who is groot?"
        end
    end
})

print(groot[1])
groot[1] = groot()
print(groot[1])
groot[2] = groot(groot(1))
print(groot[2])
groot[3] = groot(groot(1), groot(2))
print(groot[3])
groot[4] = groot(groot(1), groot(2), "banana")
print(groot[4])

print(getmetatable(groot))
print(getmetatable(groot[1]))