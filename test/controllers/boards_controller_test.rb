require 'test_helper'

class BoardsControllerTest < ActionController::TestCase
  def setup
    @board = boards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:boards)
  end

  test "should get index with search" do
    get :index, params: { search: "example" }
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:boards)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
    assert_instance_of Board, assigns(:board)
  end

  test "should create board" do
    assert_difference('Board.count') do
      post :create, params: { board: { name: "New Board", email: "new@example.com", width: 10, height: 10, mines: 5 } }
    end
    assert_redirected_to board_path(assigns(:board))
  end

  test "should render new when board creation fails" do
    assert_no_difference('Board.count') do
      post :create, params: { board: { name: "", email: "", width: 0, height: 0, mines: -1 } }
    end
    assert_response :success
    assert_template :new
  end

  test "should show board" do
    get :show, params: { id: @board }
    assert_response :success
    assert_template :show
    assert_instance_of Board, assigns(:board)
  end

  test "should redirect to index when board not found" do
    get :show, params: { id: "invalid-id" }
    assert_redirected_to boards_path
    assert_equal "Board not found", flash[:error]
  end
end
