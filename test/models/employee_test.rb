require "test_helper"

class EmployeeTest < ActiveSupport::TestCase
  it 'can save a employee' do
    employee = Employee.new(name: "test")
    assert employee.save
  end
end
