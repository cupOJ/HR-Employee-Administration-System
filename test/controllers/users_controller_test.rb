require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get get_users" do
    get users_get_users_url
    assert_response :success
  end
end
