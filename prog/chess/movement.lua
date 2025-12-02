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

    -- Prototype based function of square
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
    Creator: Edgar, David
    This function will only return false when a friendly piece is at the square
    the user wants to move to. 
--]]
function checkFriendly (p1, p2)
    return board[p1].player ~= board[p2].player
end

--[[
    Creator: David
    recursive function for the checkIfInCheck function
--]]
local function checkIfInCheckRecursive (kingSquare, rank, file)
    -- When a piece is unfriendly check if they have the King in check
    if board[rank..file].player ~= nil then
        if checkFriendly(rank..file, kingSquare) == true then
            if checkMovementAll(rank..file, kingSquare) == true then
                return true
            end
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
    Creator: David
    This function checks if the King is in checkmate
    false if not in checkmate, true if king is mated

    Does not check if a different piece could get the king out of check
        but only if the king can move
--]]
function checkCheckmate(kingsquare)
    -- Start by checking current square
    if checkIfInCheck(kingsquare) == false then
        return false
    end
    local rank, file = parseCoord(kingsquare)

    -- check all possible spaces the king can move
    -- if king can move return false, king is not in checkmate
    if checkMovementKing(kingsquare, toChar(rank+1)..(file+1)) then
        return false
    elseif checkMovementKing(kingsquare, toChar(rank+1)..(file)) then
        return false
    elseif checkMovementKing(kingsquare, toChar(rank)..(file+1)) then
        return false
    elseif checkMovementKing(kingsquare, toChar(rank-1)..(file-1)) then
        return false
    elseif checkMovementKing(kingsquare, toChar(rank-1)..file) then
        return false
    elseif checkMovementKing(kingsquare, toChar(rank)..(file-1)) then
        return false
    elseif checkMovementKing(kingsquare, toChar(rank+1)..(file-1)) then
        return false
    elseif checkMovementKing(kingsquare, toChar(rank-1)..(file+1)) then
        return false
    end
    -- king cannot move and is in check, return true
    return true
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

function checkMovementPawn (file, player) --(starSquare, endSquare)
    for i = 1, 8 do
        local square = file .. tostring(i)
        if board[square].piece == piece.pawn and board[square].player == player then
            return square
        end
    end
    return nil
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
