
-- Values of pieces
local valPieces =
{
    king = -1,
    queen = 9,
    rook = 5,
    bishop = 3,
    knight = 3,   
}

local piece = 
{
    King = "K",
    Queen = "Q",
    Rook = "R",
    Bishop = "B",
    Knight = "N",
    Pawn = "P",
}

local plr =
{
    white = "White",
    black = "Black"
}

local files = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'}
local rank = {'1', '2', '3', '4', '5', '6', '7', '8'}

local board = {}
local _board = {}

for _, rank in ipairs(rank) do
    for _, file in ipairs(files) do
        local square = file .. rank
        _board[square] = {piece = nil, plr = nil}
    end
end

setmetatable(board, 
{
    -- __index is called when trying to read a key that doesn't exist in board
    __index = function(_, key)
        -- _board[key] stores the actual data (piece + plr)
        -- If the key is found in _board, return that
        return _board[key]
    end,

    -- __newIndex is called when you try to write in board.square
    __newindex = function(_, key, value)
        -- only allow assignment if _board isnt board
        if _board[key] then
            _board[key] = value
        end
    end
}
)

-- Game functions

local function placePiece(square, piece, plr)
    board[square].piece = piece
    board[square].player = plr
end

local function printBoard()
    for i = #ranks, 1, -1 do
        
    end
end
