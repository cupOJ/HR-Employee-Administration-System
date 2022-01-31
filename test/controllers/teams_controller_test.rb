require "test_helper"

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get get_teams" do
    get teams_get_teams_url
    assert_response :success
  end
end
