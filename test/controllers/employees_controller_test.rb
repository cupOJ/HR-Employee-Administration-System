require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  test "should get get_employees" do
    get employees_get_employees_url
    assert_response :success
  end
end
