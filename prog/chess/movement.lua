-- Linking files
local functions = require("functions")
local init = require("init")

--[[
    Creator: Edgar
    This function is used to parse user entered coordinates like "a2" and turn them 
    into seperatn number like (1,2)
--]]
function parseCoord(square)

    --this checks that square is type string and 2 chars long, anything else will return nil
    if type(square) ~= "string" or #square ~= 2 then
        print("Not a valid square")
        return nil
    end

    local file = square:sub(1,1)
    local rank = square:sub(2,2)

    local x = string.byte(file) - string.byte("a") + 1 
    local y = tonumber(rank)

    --user entered an invalid coordinate
    if x < 1 or x > 8 or y < 1 or y > 8 then
    print("Coordinates are out of bounds: x = " ..x.. ", y = " ..y)
        return nil
    end
    
    print("x = " ..x.. " and y is " ..y)
    return x, y
end

--parseCoord("h1")