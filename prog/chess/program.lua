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
        end
    end,
    __newindex = function(_, key, value)
        if _board[key] then
            _board[key] = value
        end
    end
}
)

for i, file in ipairs(files) do
    PlacePiece(file.."2", piece.pawn, plr.white)
end

for i, file in ipairs(files) do
    PlacePiece(file.."7", piece.pawn, plr.black)
end

-- Setting up white pieces
PlacePiece("a1", piece.rook, plr.white)
PlacePiece("h1", piece.rook, plr.white)

PlacePiece("b1", piece.knight, plr.white)
PlacePiece("g1", piece.knight, plr.white)

PlacePiece("c1", piece.bishop, plr.white)
PlacePiece("f1", piece.bishop, plr.white)

PlacePiece("d1", piece.queen, plr.white)
PlacePiece("e1", piece.king, plr.white)

-- Setting up black pieces
PlacePiece("a8", piece.rook, plr.black)
PlacePiece("h8", piece.rook, plr.black)

PlacePiece("b8", piece.knight, plr.black)
PlacePiece("g8", piece.knight, plr.black)

PlacePiece("c8", piece.bishop, plr.black)
PlacePiece("f8", piece.bishop, plr.black)

PlacePiece("d8", piece.queen, plr.black)
PlacePiece("e8", piece.king, plr.black)

print(board.h1.player)
print(_board.h1.player)


-- board.z4 = {piece = piece.pawn, player = plr.white} -- __newindex
-- board.z4.player = plr.white -- __index
-- board.z4.piece = piece.pawn

-- print(" ")
PrintBoard()


--[[
    Author: all of us
    game logic
]]
while(true) do
    -- White
    print("Enter the piece's current square (chess notation):")
    local white = io.read()

    local wsp = string.sub(white, 1, 2)
    local wep = string.sub(white, 3, 4)
    
    MovePiece(wsp, wep)
    PrintBoard()

    -- Black
    print("Enter the piece's current square (chess notation):")
    local black = io.read()
    
    local bsp = string.sub(black, 1, 2)
    local bep = string.sub(black, 3, 4)
    
    MovePiece(bsp, bep)
    PrintBoard()
end