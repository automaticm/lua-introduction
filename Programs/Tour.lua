require("CustomGlobal")


local function intToChar(x)
    local charN = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'}
    return charN[x]
end

local board = {} -- Table with chess board data
-- holds the squares the horse has moved from and to
-- at conclusion path should contain 64 entries and no two entries should be the same
local path = {} 

-- Instantiate the board to be full of squares
for n=8, 1, -1 do
    for i=1, 8 do
        --square[1]==first square identifier, square[2]==second square identifier
        --square[3]==hasVisited, square[4]==isEmpty/HorseisntHere
        local square = {n, i, false, true}
        if n==1 and i==2 then
            square[4] = false -- starting position for the horse
            path[n] = square
        end
        table.insert(board, square)
    end
end


-- Prints the board
local str = "Board:\n"
for n=1, 64 do
    local toAddToString = board[n]
    str = str..toAddToString[1]..intToChar(toAddToString[2]).." "
    if (n%8)==0 then
        str = str.."\n"
    end
end
print("\n"..str.."\n")
