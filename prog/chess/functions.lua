local init = require("init")

--[[
    author: Ado
    Setter method for placing a piece.
    Out of bounds dealt with metamethod __index and __newindex in "program.lua"
]]
function PlacePiece(square, piece, plr)
    board[square].piece = piece
    board[square].player = plr
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
