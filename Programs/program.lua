local functions = require("functions")
local init = require("init")



for _, rank in ipairs(ranks) do
    for _, file in ipairs(files) do
        local square = file .. rank
        _board[square] = {piece = nil, plr = nil}
    end
end

-- __index is called when trying to read a key that doesn't exist in board
-- _board[key] stores the actual data (piece + plr)
-- If the key is found in _board, return that
-- __newIndex is called when you try to write in board.square
-- only allow assignment if _board isnt board
setmetatable(board, 
{
    __index = function(_, key)
        return _board[key]
    end,
    __newindex = function(_, key, value)
        if _board[key] then
            _board[key] = value
        else
            print("Error")
        end
    end
}
)

printBoard()

-- Make function later
-- Setup the board (pawns only right now)
for i, file in ipairs(files) do
    placePiece(file.."2", piece.pawn, plr.black)
end

for i, file in ipairs(files) do
    placePiece(file.."7", piece.pawn, plr.white)
end

print(" ")
printBoard()
