This is my implementation for the Game of Life code challenge.  I've also created a video demo for my solution.  

You can watch it here :
https://youtu.be/vHYXi87Mvr4


My solution is a Rails based web application.  Assuming you have Ruby and Rails installed on your laptop, just unzip the archive and from the terminal cd into that application directory.

    cd <unzipped project directory>
    bundle    
    rails s

Then visit http://localhost:3000 with your browser. Enter a name for your Game of Life demonstration and you'll be able to view the first generation.  Click on the "New Generation" button to create a new generation.  


Testing :

From the Rails console, you can run your owns tests (per the requirements of the doc).  Example :

    Game.test_game([[1, 0, 0], [1, 1, 0], [0, 0, 0]], 3, [[1, 1, 0], [1, 1, 0], [0, 0, 0]])

Sample output :

	# -----------------------------------------------------
	initial seed       = [[#<Cell:0x007ff0c1cbcf28 @alive=true>, #<Cell:0x007ff0c1cbcf00 @alive=false>, #<Cell:0x007ff0c1cbced8 @alive=false>], [#<Cell:0x007ff0c1cbcc30 @alive=true>, #<Cell:0x007ff0c1cbcbe0 @alive=true>, #<Cell:0x007ff0c1cbcac8 @alive=false>], [#<Cell:0x007ff0c1cbca00 @alive=false>, #<Cell:0x007ff0c1cbc9d8 @alive=false>, #<Cell:0x007ff0c1cbc9b0 @alive=false>]]

	1st gen game.cells = [[#<Cell:0x007ff0c1cbda90 @alive=true>, #<Cell:0x007ff0c1cbda68 @alive=true>, #<Cell:0x007ff0c1cbd950 @alive=false>], [#<Cell:0x007ff0c1cbd6f8 @alive=true>, #<Cell:0x007ff0c1cbd6a8 @alive=true>, #<Cell:0x007ff0c1cbd680 @alive=false>], [#<Cell:0x007ff0c1cbd540 @alive=false>, #<Cell:0x007ff0c1cbd4f0 @alive=false>, #<Cell:0x007ff0c1cbd478 @alive=false>]]

	2nd gen game.cells = [[#<Cell:0x007ff0c1cbda90 @alive=true>, #<Cell:0x007ff0c1cbda68 @alive=true>, #<Cell:0x007ff0c1cbd950 @alive=false>], [#<Cell:0x007ff0c1cbd6f8 @alive=true>, #<Cell:0x007ff0c1cbd6a8 @alive=true>, #<Cell:0x007ff0c1cbd680 @alive=false>], [#<Cell:0x007ff0c1cbd540 @alive=false>, #<Cell:0x007ff0c1cbd4f0 @alive=false>, #<Cell:0x007ff0c1cbd478 @alive=false>]]

	3rd gen game.cells = [[#<Cell:0x007ff0c1cbda90 @alive=true>, #<Cell:0x007ff0c1cbda68 @alive=true>, #<Cell:0x007ff0c1cbd950 @alive=false>], [#<Cell:0x007ff0c1cbd6f8 @alive=true>, #<Cell:0x007ff0c1cbd6a8 @alive=true>, #<Cell:0x007ff0c1cbd680 @alive=false>], [#<Cell:0x007ff0c1cbd540 @alive=false>, #<Cell:0x007ff0c1cbd4f0 @alive=false>, #<Cell:0x007ff0c1cbd478 @alive=false>]]

	expected end state = [[#<Cell:0x007ff0c30fab48 @alive=true>, #<Cell:0x007ff0c30fab20 @alive=true>, #<Cell:0x007ff0c30faad0 @alive=false>], [#<Cell:0x007ff0c30fa850 @alive=true>, #<Cell:0x007ff0c30fa800 @alive=true>, #<Cell:0x007ff0c30fa7d8 @alive=false>], [#<Cell:0x007ff0c30fa508 @alive=false>, #<Cell:0x007ff0c30fa4e0 @alive=false>, #<Cell:0x007ff0c30fa4b8 @alive=false>]]
	# -----------------------------------------------------
	 => true