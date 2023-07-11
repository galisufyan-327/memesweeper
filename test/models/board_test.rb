require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  def setup
    @board = Board.new(width: 5, height: 5, email: "test@gmail.com", mines: 3, name: "test")
  end

  test "name and email should be present" do
    @board.name = ""
    @board.email = ""
    assert_not @board.valid?
    assert_equal ["can't be blank"], @board.errors[:name]
    assert_equal ["can't be blank"], @board.errors[:email]
  end

  test "email should be unique" do
    @board.save
    duplicate_board = Board.new(
                            width: @board.width, 
                            height: @board.height, 
                            email: @board.email, 
                            mines: @board.mines, 
                            name: @board.name
                          )
    assert_not duplicate_board.valid?
    assert_equal ["has already been taken"], duplicate_board.errors[:email]
  end


  test "width and height should be numerical and greater than 0" do
    @board.width = "abc"
    @board.height = 0
    assert_not @board.valid?
    assert_equal ["is not a number"], @board.errors[:width]
    assert_equal ["must be greater than 0"], @board.errors[:height]
  end

  test "mines should be less than or equal to total cells" do
    @board.mines = 10
    assert @board.valid?

    @board.mines = 30
    assert_not @board.valid?
    assert_equal ["must be less than or equal to 25"], @board.errors[:mines]
  end
end
