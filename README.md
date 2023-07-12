# README

## Minesweeper Board Generation

This is a Minesweeper game board. It create's a new board by specifying the width, height, and number of mines. The board will then be generated randomly. 

## Usage

The BoardsController is responsible for handling the HTTP requests for the boards. It exposes a index action that lists all of the boards, a new action that creates a new board, and a create action that saves the new board. The Board class represents a Minesweeper board. It has the following attributes:

* name: The name of the board
* email: The email address of the owner of the board
* width: The width of the board
* height: The height of the board
* mines: The number of mines on the board
* data: The data that represents the board


The BoardService class is responsible for generating the board data. It has the following methods:
generate_board This method generates a new board with the specified width, height, and number of mines.
update_adjacent_cells This method updates the values of the adjacent cells of a cell that has been revealed.
The project also includes a number of test cases that test the functionality of the BoardsController and the Board class.


## Requirements

* Ruby version 2.7.3
* Rails version 6.0.6
* Postgres database 

## Installation

* Clone the repository:
`git clone git@github.com:galisufyan-327/minesweeper.git` 

* Navigate to the project directory:
`cd memesweeper_app`

* Install the required dependencies:
`bundle install`
`install nodejs 18.16.0`
`yarn install`

* Set up the database:
`rails db:create
rails db:migrate`

* Start the Rails server:
`rails server`

* Open your web browser and access the application at http://localhost:3000.


