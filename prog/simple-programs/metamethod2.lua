-- example make a table callable using __call metamethod
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

-- doesnt matter what u use as a parameter
print(groot())
print(groot(1))
print(groot(1, 2))

print("")

print(groot[1])
groot[1] = groot()
print(groot[1])
groot[2] = groot(groot(1))
print(groot[2])