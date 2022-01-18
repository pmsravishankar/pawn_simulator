# The Pawn Simulator

## Installation

### Setting up the development environment

1.  Get the code. Clone this git repository and check out the latest release:

    ```bash
    git clone git@github.com:pmsravishankar/pawn_simulator.git
    cd pawn_simulator
    git checkout latest
    ````
2. Install rspec gem
	```bash
	gem install rspec
	````

3. run ruby script file
	```bash
	ruby chess.rb
	```

4. This script will read the following commands:
	- PLACE X,Y,F,C
		- Position: X, Y
		- Facing: NORTH, SOUTH, EAST or WEST and
		- Colour: White or Black
	- MOVE X
	- LEFT
	- RIGHT
	- REPORT
