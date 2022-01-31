require "test_helper"

class DivisionsControllerTest < ActionDispatch::IntegrationTest
  test "should get get_divisions" do
    get divisions_get_divisions_url
    assert_response :success
  end
end
