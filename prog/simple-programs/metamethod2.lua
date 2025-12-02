-- example make a table callable using __call metamethod
local groot = {}

setmetatable(groot, {
    __call = function(self, ...)
        local args = {...}
        local len = #args

        if len == 0 then
            return "No one is groot"
        elseif len == 1 then
            return "I am groot"
        end
    end
})