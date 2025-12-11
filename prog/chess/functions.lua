local init = require("init")

--[[
    author: Ado
    Setter method for placing a piece.
    Out of bounds dealt with metamethod __index and __newindex in "program.lua"
]]
function PlacePiece(square, piece, plr)
    _board[square].piece = piece
    _board[square].player = plr
end

--[[
    author: Ado
    Prints the chess board. 
    Lower case chess notation if the player is black.
    Upper case chess notation if the player is white.
]]
function PrintBoard()
    for i = #ranks, 1, -1 do
        local row = ""
        local rank = ranks[i]
        for _, file in ipairs(files) do
            local square = file .. rank
            local value = board[square]
            if value.piece then
                local sym = value.player
                if value.player == "black" then
                    sym = sym .. "Black"
                    row = row .. "[" .. string.lower(value.piece) .. "]"
                else
                    sym = sym .. "White"
                    row = row .. "[" .. value.piece .. "]"
                end
            else
                row = row .. "[ ]"
            end
    end
        print(row)
    end
end

--[[
    Creator: David
    Takes current rank and returns the character representing the rank to the right (white perspective)
--]]
function NextRank(curr)
    if curr == 'a' then
        return 'b'
    elseif curr =='b' then
        return 'c'
    elseif curr == 'c' then
        return 'd'
    elseif curr == 'd' then
        return 'e'
    elseif curr == 'e' then
        return 'f'
    elseif curr == 'f' then
        return 'g'
    elseif curr == 'g' then
        return 'h'
    else 
        return 'a'
    end
end

--[[
    Creator: David
    turns number 'x' into correspoding char
--]]
function toChar(x)
    if x == 2 then
        return 'b'
    elseif x == 3 then
        return 'c'
    elseif x == 4 then
        return 'd'
    elseif x == 5 then
        return 'e'
    elseif x == 6 then
        return 'f'
    elseif x == 7 then
        return 'g'
    elseif x == 8 then
        return 'h'
    elseif x == 1 then
        return 'a'

    -- In the edge case when x is out of bounds then return the letter closest to that boundary
    else 
        if x > 8 then
            return 'h'
        else
            return 'a'
        end
    end
end

--[[
    Author: Ado
    returns the square where the piece is found or nil if no piece exists'
    (words with piece.pawn, generic doesnt)
    changed to pawn for now - this is difficult logic to implement
--]]
function FindPieceOnFile(file, player)
    for i = 1, 8 do
        local square = file .. tostring(i)
        if board[square].piece == piece.pawn and board[square].player == player then
            return square
        end
    end
    return nil
end

--[[
    Author: Ado
    Moves a piece from one square to another
--]]
function MovePiece(fromSquare, toSquare)
    if board[fromSquare].piece then
        local movingPiece = board[fromSquare].piece
        local movingPlayer = board[fromSquare].player
        -- Clears the original square
        board[fromSquare].piece = nil
        board[fromSquare].player = nil
        
        -- Place piece on new square
        PlacePiece(toSquare, movingPiece, movingPlayer)
        return true
    else
        -- Don't add the logic to return to player's turn
        -- if move / piece doesnt exist.
        -- Thanks - Ado
        return false
    end
end
