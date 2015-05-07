require "test_helper"

class PointsControllerTest < ActionController::TestCase

  test "should get all points" do
    get :index
    assert_response :success
    assert_not_nil assigns(:points)
  end

end
