-- Linking files
local functions = require("functions")
local init = require("init")
--local movement = require("movement")


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

for i, file in ipairs(files) do
    -- PlacePiece(file.."2", piece.pawn, plr.black)
    PlacePiece(file.."2", piece.pawn, plr.white)
end

for i, file in ipairs(files) do
    -- PlacePiece(file.."7", piece.pawn, plr.white)
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

-- print(board.h1.player)
-- print(_board.h1.player)


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
    -- White's turn
    print("White's turn:")
    print("Enter the piece you want to move (chess notation):")
    local whitePiece = io.read()
    
    print("Enter destination square (chess notation):")
    local whiteMove = io.read()
    
    if whitePiece == "p" or whitePiece == "P" then
        local file = whiteMove:sub(1, 1)  -- Get the file (a-h)
        local pawnSquare = FindPieceOnFile(file, plr.white)
        if pawnSquare then
            MovePiece(pawnSquare, whiteMove)
        else
            print("No white pawn found on file " .. file)
        end
    else
        -- For now, just places the pawn.
        -- FindPieceOnFile should place all pieces, but I made it for pawns only.
        -- Can't get other to work, but using (white's file on line 105) which I believe is the cause (after adding piece in FindPieceOnFile)
        -- Whenever someone gets the chance, can you implement the methods you made in movement.lua.
        -- Thanks - Ado
    end

    -- Show board after moving piece
    PrintBoard()

    -- Black's turn
    print("\nBlack's turn:")
    print("Enter the piece you want to move (chess notation):")
    local blackPiece = io.read()
    
    print("Enter destination square (chess notation):")
    local blackMove = io.read()
    
    if blackPiece == "p" or blackPiece == "P" then
        local file = blackMove:sub(1, 1)
        local pawnSquare = FindPieceOnFile(file, plr.black)
        
        if pawnSquare then
            MovePiece(pawnSquare, blackMove)
        else
            print("No black pawn found on file " .. file)
        end
    else
        -- For now, just places the pawn.
        -- FindPieceOnFile should place all pieces, but I made it for pawns only.
        -- Can't get other to work, but using (white's file on line 105) which I believe is the cause (after adding piece in FindPieceOnFile)
        -- Whenever someone gets the chance, can you implement the methods you made in movement.lua.
        -- Thanks - Ado
    end

    PrintBoard()
end