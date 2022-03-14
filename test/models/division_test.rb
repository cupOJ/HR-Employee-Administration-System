require "test_helper"

class DivisionTest < ActiveSupport::TestCase
it 'can save a division' do
  division = Division.new(name: "test")
  assert division.save
end
