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
--inBoard("a1")

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


--[[
    Creator: Edgar
    This functino makes sure that there is a valid peice in the start square, 
    the first square that will be asked by the user. Only returns true on valid squares.
--]]
function validStart(startSqr)

end



--[[
    Creator: Edgar
    This function will only return false when a friendly piece is at the square
    the user wants to move to. 
--]]
function checkFriendly (endSquare)
    
end

--[[
    Creator: David
    recursive function for the checkIfInCheck function
--]]
local function checkIfInCheckRecursive (kingSquare, rank, file)
    -- When a piece is unfriendly check if they have the King in check
    if checkFriendly(board[rank..file]) == false then
        if checkMovementAll(rank..file, kingSquare) == true then
            return true
        end
    end

    if (rank..file) == "h8" then
        return false
    end
    
    rank = NextRank(rank)
    if rank == 'a' then
        file = file + 1
    end
    return checkIfInCheckRecursive(kingSquare, rank, file)
end

--[[
    Creator: David
    THis function will check if the King is in check
    returns a boolean "true" when in check and "false" when not in check
--]]
function checkIfInCheck (kingSquare)
    -- Check every square on the board to see if a piece can see the King
    local rank = 'a'
    local file = 1
    return checkIfInCheckRecursive(kingSquare, rank, file)
end

--[[
    Creator: Edgar
    These functions simple return true or false if the selected piece can move in the way the user want it to move
--]]
function checkMovementKing (starSquare, endSquare)
end
function checkMovementQueen (starSquare, endSquare)
end
function checkMovementBishop (starSquare, endSquare)
end
function checkMovementRook (starSquare, endSquare)
end
function checkMovementKnight (starSquare, endSquare)
end
function checkMovementPawn (starSquare, endSquare)
end

--[[
    Creator: David
    checkAll takes the starSquare and parses what piece it is
    returns the same as previous checkMovement functions
--]]
function checkMovementAll(starSquare, endSquare)
    if board[starSquare] == piece.king then
        return checkMovementKing(starSquare, endSquare)
    elseif board[starSquare] == piece.queen then
        return checkMovementQueen(starSquare, endSquare)
    elseif board[starSquare] == piece.rook then
        return checkMovementRook(starSquare, endSquare)
    elseif board[starSquare] == piece.knight then
        return checkMovementKnight(starSquare, endSquare)
    elseif board[starSquare] == piece.bishop then
        return checkMovementBishop(starSquare, endSquare)
    elseif board[starSquare] == piece.pawn then
        return checkMovementPawn(starSquare, endSquare)
    end
end


--[[
    Creator: Edgar
    This function will piece everything together and make the movement happen. 
--]]
function movement()

end
