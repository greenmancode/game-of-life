# Game Of Life
Conway's Game Of Life (written in Love2D/Lua)

# Information
This game is a recreation of Conway's Game Of Life devised by the British mathemetician John Conway in 1970.

The game is a **zero-player** game meaning that the game runs based on its initial state and without any input from the user.

The game is a 2D grid of square cells, with each cell being in an alive or dead state. The evolution of the game is based on every cells' neighbors which are the cells that are horizontally, vertically, and diagonally adjacent.

# Rules
Every cells' state is changed every update based on these rules:
  1. Any live cell with fewer than two live neighbours dies, as if by underpopulation.
  2. Any live cell with two or three live neighbours lives on to the next generation.
  3. Any live cell with more than three live neighbours dies, as if by overpopulation.
  4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

In this version, the first generation is created by iterating through each cell in the grid and giving each cell a 50% chance to be alive and if the cell does not become alive, it starts as dead.

# Usage
If you just want to run the game, go to the [releases](https://github.com/greenmancode/gameOfLife/releases) page and install the binary for your platform.

The game uses an engine called [Love2D](https://love2d.org/) which is used to run the game (if you download the source code).

1. Download Love2D for your platform
2. Clone this repo using `git`
```bash
$ git clone https://github.com/greenmancode/gameOfLife.git
```
and make sure that your file structure looks like this:
```
README.md
LICENSE
GOL
|  main.lua
|  conf.lua
```
3. Make sure you are one level above the directory containing the game files and use `love` to run the game:
```bash
$ love GOL
```
