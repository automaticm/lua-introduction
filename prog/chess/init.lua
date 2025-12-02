-- board will be an empty proxy table that redirects to _board
-- _board is the actual storage table that holds all square data
board = {}
_board = {}

files = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'}
ranks = {'1', '2', '3', '4', '5', '6', '7', '8'}

valPieces =
{
    king = -1,
    queen = 9,
    rook = 5,
    bishop = 3,
    knight = 3,   
}

piece =  
{
    king = "K",
    queen = "Q",
    rook = "R",
    bishop = "B",
    knight = "N",
    pawn = "P",
}

plr =
{
    white = "white",
    black = "black"
}



