require "test_helper"
 
class UserTest < ActiveSupport::TestCase

  context "token" do

    setup do
      @user = FactoryGirl.build(:user)
    end

    should "generate and store token" do
      assert @user.token.blank?
      assert @user.save

      assert @user.token.present?
    end

  end

  context "authorization" do

    setup do
      attributes = { email:       "john@zorn.com",
                     first_name:  "John",
                     last_name:   "Zornie Zorn" }
      provider = stub(info: attributes, access_token: "aaaa")
      User::FacebookProvider.stubs(:new).with("1234").returns(provider)
    end

    should "create new user" do
      assert_difference "User.count" do
        User.create_from_authorization_code("1234")
      end

      user = User.last
      assert_equal "john@zorn.com", user.email
      assert_equal "John", user.first_name
      assert_equal "Zornie Zorn", user.last_name
    end

    should "update an existing user" do
      FactoryGirl.create(:user, email: "john@zorn.com")

      user = User.last
      assert_equal "Zorn", user.last_name

      assert_no_difference "User.count" do
        User.create_from_authorization_code("1234")
      end

      user = User.last
      assert_equal "john@zorn.com", user.email
      assert_equal "John", user.first_name
      assert_equal "Zornie Zorn", user.last_name
    end
  end

end
