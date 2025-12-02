# Chess Game in Lua
### Finished
	Initializing the chess board
	Placing chess pieces
	Printing the board
	Setting the metatable of board (indexable via string)
	 > Check
	 	> King is in an attack and needs to move out the way
	User input done (game functions, logic isn't fully done)
### To-Do
	Capturing pieces (goes hand and hhand with user input)
	Point system from capturing pieces (points defined in init.lua)
	Add this this link on the website that we are making: https://gist.github.com/oatmealine/655c9e64599d0f0dd47687c1186de99f
	Game logic
		> Pawns should not be able to take horizontally, only diagonally.
		> Pawns should not be able to move 2 squares after the first move
			> This includes not moving over a pawn.
		> En-passant
		> Check, checkmate, and draw positions
			> Draw is not possible in the first 9 moves of chess. At the 10th move, check for draws.
				> Maybe add a variable outside the loop to check the amount of times a player has moved? Iterate in the loop
				> Should automatically be a draw if no pieces, only one
		 		> knight, only one bishop
		> Checkmate
	  		> No valid moves for the king and no pieces can capture the checkmated king.
# lua-introduction

### basics (expand later)
	no zero-based indexing (1-based-indexing)
	tables are the only formal data structuring mechanism
