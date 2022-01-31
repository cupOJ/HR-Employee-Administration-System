require "test_helper"

class TargetsControllerTest < ActionDispatch::IntegrationTest
  test "should get get_targets" do
    get targets_get_targets_url
    assert_response :success
  end
end
