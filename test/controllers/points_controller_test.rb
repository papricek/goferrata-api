require "test_helper"

class PointsControllerTest < ActionController::TestCase

  context "with an existing point" do

    setup do
      @point = FactoryGirl.create(:point)
    end

    should "return one point" do
      get :index
      assert_response :success
      assert_not_nil assigns(:points)
      assert_equal [@point], assigns(:points)
    end

  end

end
