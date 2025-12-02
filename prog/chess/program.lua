-- Linking files
local functions = require("functions")
local init = require("init")
local movement = require("movement")


for _, rank in ipairs(ranks) do
    for _, file in ipairs(files) do
        local square = file .. rank
        _board[square] = {piece = nil, plr = nil}
    end
end

--[[
__index is called when trying to read a key that doesn't exist in board
-- _board[key] stores the actual data (piece + plr)
-- If the key is found in _board, return that
-- __newIndex is called when you try to write in board.square
only allow assignment if _board isnt board
]]

-- Create a proxy table. board becomes a "reference" to _board (that has actual data)
-- This allows board.e4 and board["e4"] to work while providing validation
setmetatable(board, 
{
    __index = function(_, key)
        if _board[key] then
            return _board[key]
        else
            print("Invalid square")
        end
    end,
    __newindex = function(_, key, value)
        if _board[key] then
            _board[key] = value
        else
            print("Error: Invalid chess square '" .. key .. "'")
        end
    end
}
)

-- printBoard()
-- Make function later
-- Setup the board (pawns only right now)
-- In chess, the black pieces should be on top, I (Edgar) switched these around bc black was in the bottom

for i, file in ipairs(files) do
    -- PlacePiece(file.."2", piece.pawn, plr.black)
    PlacePiece(file.."2", piece.pawn, plr.white)
end

for i, file in ipairs(files) do
    -- PlacePiece(file.."7", piece.pawn, plr.white)
    PlacePiece(file.."7", piece.pawn, plr.black)
end

--setting up white pieces
PlacePiece("a1", piece.rook, plr.white)
PlacePiece("h1", piece.rook, plr.white)

PlacePiece("b1", piece.knight, plr.white)
PlacePiece("g1", piece.knight, plr.white)

PlacePiece("c1", piece.bishop, plr.white)
PlacePiece("f1", piece.bishop, plr.white)

PlacePiece("d1", piece.queen, plr.white)
PlacePiece("e1", piece.king, plr.white)

--setting up black pieces
PlacePiece("a8", piece.rook, plr.black)
PlacePiece("h8", piece.rook, plr.black)

PlacePiece("b8", piece.knight, plr.black)
PlacePiece("g8", piece.knight, plr.black)

PlacePiece("c8", piece.bishop, plr.black)
PlacePiece("f8", piece.bishop, plr.black)

PlacePiece("d8", piece.queen, plr.black)
PlacePiece("e8", piece.king, plr.black)




-- show examples of when one metamethod is triggered
-- board.z4 = {piece = piece.pawn, player = plr.white} -- __newindex
-- board.z4.player = plr.white -- __index
-- board.z4.piece = piece.pawn

-- print(" ")
PrintBoard()