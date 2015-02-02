require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get callback" do
    get :callback
    assert_response :success
  end

end
