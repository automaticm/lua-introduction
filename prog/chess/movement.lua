-- Linking files
local functions = require("functions")
local init = require("init")


--[[
    Creator: Edgar
    This function is used to see if the square passed in is a location inside 
    the board
--]]
function inBoard(square)

    --this checks that square is type string and 2 chars long, anything else will return nil
    if type(square) ~= "string" or #square ~= 2 then
        print("Not a valid square")
        return false
    end

    local file = square:sub(1,1)
    local rank = square:sub(2,2)

    local x = string.byte(file) - string.byte("a") + 1 
    local y = tonumber(rank)

    --user entered an invalid coordinate
    if x < 1 or x > 8 or y < 1 or y > 8 then
    print("Coordinates are out of bounds: x = " ..x.. ", y = " ..y)
        return false
    end
    
    print("x = " ..x.. " and y is " ..y) 
    return true
end

--[[
    Creator: Edgar
    This function is used to parse user entered coordinates like "a2" and turn them 
    into seperatn number like (1,2).
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


function moveValidate(startSquare, endSquare) 
    local startSqr = board[startSquare]
    local endSqr = board[endSquare]

    if not startSqr or not startSqr.piece then
        print("Error: there isnt a piece at the square")
        return false
    end

    if endSqr.peice then
        print("")
    end

end


--[[
    Creator: Edgar
    This functino makes sure that there is a valid peice in the start square, 
    the first square that will be asked by the user. Only returns true on valid squares.
--]]
function validStart(startSqr)
    if not startSqr or not startSqr.piece then
        print("Error: there isnt a piece at the square")
        return false
    end
    return true
end

--[[
    Creator: Edgar
    This function will only return false when a friendly piece is at the square
    the user wants to move to. 
--]]
function validEnd (endSquare)
    
end


--[[
    Creator: Edgar
    This function will find the type of piece. Each pieces move differently, so this finds out what type the piece is,
    and determines if the piece can actually move to the destination
--]]
function findType (startSquare)

    
end