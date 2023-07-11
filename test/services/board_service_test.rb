require 'test_helper'

class BoardServiceTest < ActiveSupport::TestCase
  test "should generate board with mines" do
    width = 5
    height = 5
    mines = 5

    board = BoardService.generate_board(width, height, mines)

    assert_equal height, board.size
    board.each do |row|
      assert_equal width, row.size
    end

    mine_count = count_mines(board)
    assert_equal mines, mine_count
  end

  test "should generate empty board when mines is 0" do
    width = 8
    height = 8
    mines = 0

    board = BoardService.generate_board(width, height, mines)

    assert_equal height, board.size
    board.each do |row|
      assert_equal width, row.size
      assert_equal [0] * width, row
    end

    mine_count = count_mines(board)
    assert_equal mines, mine_count
  end

  test "should generate board with maximum mines" do
    width = 10
    height = 10
    mines = width * height

    board = BoardService.generate_board(width, height, mines)

    assert_equal height, board.size
    board.each do |row|
      assert_equal width, row.size
    end

    mine_count = count_mines(board)
    assert_equal mines, mine_count
  end

  private

  def count_mines(board)
    count = 0
    board.each do |row|
      row.each do |cell|
        count += 1 if cell == "M"
      end
    end
    count
  end
end
