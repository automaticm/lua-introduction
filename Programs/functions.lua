local init = require("init")

function placePiece(square, piece, plr)
    board[square].piece = piece
    board[square].player = plr
end

function printBoard()
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
                end
                row = row .. "[" .. value.piece .. "]"
            else
                row = row .. "[]"
            end
    end
        print(row)
    end
end
